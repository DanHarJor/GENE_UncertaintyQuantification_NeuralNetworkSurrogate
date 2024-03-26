PRO Tsolve

  N_steps = 120000L
  dt = 0.00001

  N_x = 50

  ; initial core and fixed edge T_i,e / keV and n_i = n_e / (10^19 m^-3)
  Ti_init = 12.6
  Ti_sep = 1.0
  Te_init = 10.0
  Te_sep = 1.0
  ne_init = 5.0
  ne_sep = 0.5
  ; mimicking neoclassical/residual flux
  chi_residual = 0.05

  write_output = 0

  x = FLTARR(N_x)
  T_i = FLTARR(N_x+2)
  T_e = FLTARR(N_x+2)
  n_e = FLTARR(N_x+2)
  Pi_ext = FLTARR(N_x)
  Pe_ext = FLTARR(N_x)
  Ti_temp = FLTARR(N_x+2)
  Te_temp = FLTARR(N_x+2)
  Q_ei = FLTARR(N_x)
  chi_i = FLTARR(N_x)
  chi_e = FLTARR(N_x)
  q = FLTARR(N_x)
  k1 = FLTARR(N_x)
  k23 = FLTARR(N_x)

  ; initial condition
  I_current = 0
  FOR k = 0, N_x - 1 DO BEGIN
    x[k] = k / (N_x - 1.0)
    T_i[k+1] = (Ti_init - Ti_sep) * (N_x - 1 - (k - 1)) / (N_x - 1.0) + Ti_sep
    T_e[k+1] = (Te_init - Te_sep) * (N_x - 1 - (k - 1)) / (N_x - 1.0) + Te_sep
    n_e[k+1] = (ne_init - ne_sep) * (N_x - 1 - (k - 1)) / (N_x - 1.0) + ne_sep
    Pi_ext[k] = 80 * EXP(-50*(x[k]-0.1)^2)
    Pe_ext[k] = 50 * EXP(-100*(x[k]-0.4)^2)
    I_current += 2 * !PI * (4e6 * (1 - x[k]^2)^3) * x[k] / (N_x - 1)
    q[k] = 2 * !PI * x[k]^2 * 10 / (3 * 1.26e-6 * I_current) > 1
  ENDFOR
  q[0] = q[1]
  s_over_q = (x / q^2) * DERIV(x,q)
  apply_BCs, T_i, Ti_sep
  apply_BCs, T_e, Te_sep
  apply_BCs, n_e, ne_sep

  construct_rnT, r_n_Ti, x, n_e, T_i, Ti_sep, ne_sep
  r_n_Ti_temp = r_n_Ti
  construct_rnT, r_n_Te, x, n_e, T_e, Te_sep, ne_sep
  r_n_Te_temp = r_n_Te

  inv_dx2 = 1.0 / (x[1] - x[0])^2
  inv_2dx = 0.5 / (x[1] - x[0])

  col = 1
  DEVICE, DECOMPOSED=1
  !P.CHARSIZE = 3
  !P.MULTI = [0,2,1]
  !P.BACKGROUND = 'FFFFFF'xL
  !X.MARGIN = [6,1]
  !Y.MARGIN = [3,0.5]

  PLOT, x, T_i[1:N_x], TITLE='!6', XTITLE='!6r/a', YTITLE='!6T!Di!N', COLOR=1
  OPLOT, x, 0.1 * Pi_ext, LINE=2, COLOR=1
  yrange_i = !Y.CRANGE

  PLOT, x, T_e[1:N_x], TITLE='!6', XTITLE='!6r/a', YTITLE='!6T!De!N', COLOR=1
  OPLOT, x, 0.1 * Pe_ext, LINE=2, COLOR=1
  yrange_e = !Y.CRANGE

  DEVICE, DECOMPOSED=0
  LOADCT, 33

  FOR t = 0, N_steps - 1 DO BEGIN
;t0 = SYSTIME(1)
    ei_coupling, Q_ei, T_i, T_e, n_e
;PRINT, 'ei_coupling', SYSTIME(1) - t0
    chii_last = chi_i
    chie_last = chi_e
;t0 = SYSTIME(1)
    turb_chi, chi_i, chi_e, T_i, T_e, chi_residual, s_over_q
;PRINT, 'turb_chi', SYSTIME(1) - t0
    ; mimicking Pereverzev; unclear whether necessary for explicit with small dt
    chi_i = 0.8 * chi_i + 0.2 * chii_last
    chi_e = 0.8 * chi_e + 0.2 * chie_last

    ; --- ions ---
;t0 = SYSTIME(1)
    ki_eval, k1, r_n_Ti, x, n_e, T_i, chi_i, inv_2dx, Ti_sep, ne_sep, Pi_ext, Q_ei
;PRINT, 'ki_eval', SYSTIME(1) - t0
    r_n_Ti_temp[1:N_x] = r_n_Ti[1:N_x] + dt * k1[*] / 3.0
;t0 = SYSTIME(1)
    apply_BCs, r_n_Ti_temp, ne_sep * Ti_sep
;PRINT, 'apply_BCs', SYSTIME(1) - t0
;ei_coupling   8.4877014e-05
;turb_chi   0.00024700165
;ki_eval   9.2983246e-05
;apply_BCs   1.9073486e-06
    
    ki_eval, k23, r_n_Ti_temp, x, n_e, T_i, chi_i, inv_2dx, Ti_sep, ne_sep, Pi_ext, Q_ei
    r_n_Ti_temp[1:N_x] = r_n_Ti[1:N_x] + dt * k23[*] * 2.0 / 3.0
    apply_BCs, r_n_Ti_temp, ne_sep * Ti_sep

    ki_eval, k23, r_n_Ti_temp, x, n_e, T_i, chi_i, inv_2dx, Ti_sep, ne_sep, Pi_ext, Q_ei
    r_n_Ti[1:N_x] = r_n_Ti[1:N_x] + 0.25 * dt * (k1[*] + 3.0 * k23[*])
    apply_BCs, r_n_Ti, ne_sep * Ti_sep

    T_i[2:N_x] = r_n_Ti[2:N_x] / (n_e[2:N_x] * x[1:*])
    T_i[1] = T_i[2]
    apply_BCs, T_i, Ti_sep

    ; --- electrons ---
    ki_eval, k1, r_n_Te, x, n_e, T_e, chi_e, inv_2dx, Te_sep, ne_sep, Pe_ext, - Q_ei
    r_n_Te_temp[1:N_x] = r_n_Te[1:N_x] + dt * k1[*] / 3.0
    apply_BCs, r_n_Te_temp, ne_sep * Te_sep
    
    ki_eval, k23, r_n_Te_temp, x, n_e, T_e, chi_e, inv_2dx, Te_sep, ne_sep, Pe_ext, - Q_ei
    r_n_Te_temp[1:N_x] = r_n_Te[1:N_x] + dt * k23[*] * 2.0 / 3.0
    apply_BCs, r_n_Te_temp, ne_sep * Te_sep

    ki_eval, k23, r_n_Te_temp, x, n_e, T_e, chi_e, inv_2dx, Te_sep, ne_sep, Pe_ext, - Q_ei
    r_n_Te[1:N_x] = r_n_Te[1:N_x] + 0.25 * dt * (k1[*] + 3.0 * k23[*])
    apply_BCs, r_n_Te, ne_sep * Te_sep

    T_e[2:N_x] = r_n_Te[2:N_x] / (n_e[2:N_x] * x[1:*])
    T_e[1] = T_e[2]
    apply_BCs, T_e, Te_sep

    IF ((t MOD 5000) + 1) MOD 5000 EQ 0 THEN BEGIN
      PRINT, "time =", (t + 1) * dt, ", T(r=0) =", T_i[1], ", T_i(r=a) =", T_i[N_x]

      !P.MULTI = [2,2,1]
      DEVICE, DECOMPOSED=1
      PLOT, x, T_i[1:N_x], COLOR=1, XRANGE=[0,1], YRANGE=yrange_i, /NOERASE, /NODATA
      OPLOT, [0,1], [5,5], COLOR=1
      DEVICE, DECOMPOSED=0
      OPLOT, x, T_i[1:N_x], COLOR=col
      OPLOT, x, 5 + 3 * chi_i, LINE=1, COLOR=col

      !P.MULTI = [1,2,1]
      DEVICE, DECOMPOSED=1
      PLOT, x, T_e[1:N_x], COLOR=1, XRANGE=[0,1], YRANGE=yrange_e, /NOERASE, /NODATA
      OPLOT, [0,1], [5,5], COLOR=1
      DEVICE, DECOMPOSED=0
      OPLOT, x, T_e[1:N_x], COLOR=col
      OPLOT, x, 5 + 3 * chi_i, LINE=1, COLOR=col

      col += 10
    ENDIF
  ENDFOR

END

PRO construct_rnT, r_n_T, x, n_ie, T_ie, T_sep, n_sep

  N_x = N_ELEMENTS(x)

  r_n_T = n_ie * T_ie
  r_n_T[1:N_x] *= x

  apply_BCs, r_n_T, T_sep * n_sep

END

PRO ki_eval, ki, r_n_T, x, n_ie, T_ie, chi_ie, inv_2dx, T_sep, n_sep, P_ext, Q_coupling

  N_x = N_ELEMENTS(ki)

  inner_term = FLTARR(N_x+2)
  FOR k = 0, N_x - 1 DO inner_term[k+1] = $
    x[k] * n_ie[k+1] * chi_ie[k] * (T_ie[k+1+1] - T_ie[k-1+1]) * inv_2dx
  apply_BCs, inner_term, chi_ie[N_x-1] * x[N_x-1] * n_sep * T_sep

  FOR k = 0, N_x - 1 DO ki[k] = $
    (2.0 / 3.0) * (inner_term[k+1] - inner_term[k-1+1]) * 2 * inv_2dx + $
    (2.0 / 3.0) * x[k] * (P_ext[k] + Q_coupling[k])

END

PRO turb_chi, chi_i, chi_e, T_i, T_e, chi_residual, s_over_q

  N_x = N_ELEMENTS(chi_i)

  FOR k = 0, N_x - 1 DO BEGIN
    ; modified threshold to account for aspect ratio
    omegaT_crit = 0.5 * (1 + T_i[k+1] / T_e[k+1]) * (1 + 2 * s_over_q[k])
    omega_Ti = - N_x * (T_i[k+1+1] - T_i[k+1]) / T_i[k+1]
    omega_Te = - N_x * (T_e[k+1+1] - T_e[k+1]) / T_e[k+1]
    omega_T = omega_Ti > omega_Te
    modfac_ITG = omega_Ti GT omega_Te ? 1 : 0.5
    modfac_TEM = omega_Ti GT omega_Te ? 0.5 : 1
    omega_m_thresh = (omega_T - omegaT_crit) > 0
    ; rho_i(1 T) ~ 0.0001 * SQRT(T_i / eV) m; use deuterium mass
    chi_i[k] = modfac_ITG * (T_i[k+1]*1000)^1.5 * 1e-6 * omega_m_thresh^2 ; < 20
    chi_e[k] = modfac_TEM * (T_i[k+1]*1000)^1.5 * 1e-6 * omega_m_thresh^2 ; < 20
  ENDFOR

  ; some level of e.g. neoclassical-ish
  chi_i += chi_residual
  chi_e += chi_residual

END

PRO ei_coupling, Q_ei, T_i, T_e, n_e

  N_x = N_ELEMENTS(Q_ei)

  FOR k = 0, N_x - 1 DO BEGIN
    Lambda_ei = 15.2 - 0.5 * ALOG10(0.1*n_e[k+1]) + ALOG10(0.001*T_e[k+1])
    tau_e = 3.44e-8 / Lambda_ei * (T_e[k+1] * 1.16e7)^1.5
;PRINT, tau_e
;STOP
    tau_e = tau_e * (0.001)^1.5
;;;;;;;;;;;;;;;;;;;;;rewrite: T_ei in tau, Q is in Joules!
    Q_ei[k] = 1.5 * n_e[k+1] * (T_e[k+1] - T_i[k+1]) / (30.0 * tau_e)
  ENDFOR

END

PRO apply_BCs, a_dyn, adyn_sep

  N_x = N_ELEMENTS(a_dyn) - 2

  a_dyn[0] = a_dyn[1]
  a_dyn[N_x+1] = adyn_sep

END