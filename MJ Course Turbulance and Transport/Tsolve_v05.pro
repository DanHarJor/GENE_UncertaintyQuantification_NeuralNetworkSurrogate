PRO Tsolve

  N_steps = 10000L
  dt = 0.001

  N_x = 50

  ; initial core and fixed edge T_i,e / keV and n_i = n_e / (10^19 m^-3)
  Ti_init = 12.6
  Ti_sep = 1.0
  ne_init = 5.0
  ne_sep = 0.5

  write_output = 0

  x = FLTARR(N_x)
  T_i = FLTARR(N_x+2)
  n_e = FLTARR(N_x+2)
  Pi_ext = FLTARR(N_x)
  Ti_temp = FLTARR(N_x+2)
  chi_i = FLTARR(N_x)
  k1 = FLTARR(N_x)
  k23 = FLTARR(N_x)

  ; initial condition
  FOR k = 0, N_x - 1 DO BEGIN
    x[k] = k / (N_x - 1.0)
    T_i[k+1] = (Ti_init - Ti_sep) * (N_x - 1 - (k - 1)) / (N_x - 1.0) + Ti_sep
    n_e[k+1] = (ne_init - ne_sep) * (N_x - 1 - (k - 1)) / (N_x - 1.0) + ne_sep
    Pi_ext[k] = 180 * EXP(-50*(x[k]-0.1)^2)
    chi_i[k] = 0.5
  ENDFOR
  apply_BCs, T_i, Ti_sep
  apply_BCs, n_e, ne_sep

  construct_rnT, r_n_Ti, x, n_e, T_i, Ti_sep, ne_sep
  r_n_Ti_temp = r_n_Ti

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

  PLOT, x, T_i[1:N_x], TITLE='!6', XTITLE='!6r/a', YTITLE='!6T!De!N', COLOR=1
  OPLOT, x, 0.1 * Pi_ext, LINE=2, COLOR=1
  yrange_e = !Y.CRANGE

  DEVICE, DECOMPOSED=0
  LOADCT, 33

  FOR t = 0, N_steps - 1 DO BEGIN
    ; --- ions ---
    ki_eval, k1, r_n_Ti, x, n_e, T_i, chi_i, inv_2dx, Ti_sep, ne_sep, Pi_ext
    r_n_Ti_temp[1:N_x] = r_n_Ti[1:N_x] + dt * k1[*] / 3.0
    apply_BCs, r_n_Ti_temp, ne_sep * Ti_sep
    
    ki_eval, k23, r_n_Ti_temp, x, n_e, T_i, chi_i, inv_2dx, Ti_sep, ne_sep, Pi_ext
    r_n_Ti_temp[1:N_x] = r_n_Ti[1:N_x] + dt * k23[*] * 2.0 / 3.0
    apply_BCs, r_n_Ti_temp, ne_sep * Ti_sep

    ki_eval, k23, r_n_Ti_temp, x, n_e, T_i, chi_i, inv_2dx, Ti_sep, ne_sep, Pi_ext
    r_n_Ti[1:N_x] = r_n_Ti[1:N_x] + 0.25 * dt * (k1[*] + 3.0 * k23[*])
    apply_BCs, r_n_Ti, ne_sep * Ti_sep

    T_i[2:N_x] = r_n_Ti[2:N_x] / (n_e[2:N_x] * x[1:*])
    T_i[1] = T_i[2]
    apply_BCs, T_i, Ti_sep

    IF ((t MOD 1000) + 1) MOD 1000 EQ 0 THEN BEGIN
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
      PLOT, x, T_i[1:N_x], COLOR=1, XRANGE=[0,1], YRANGE=yrange_e, /NOERASE, /NODATA
      OPLOT, [0,1], [5,5], COLOR=1
      DEVICE, DECOMPOSED=0
      OPLOT, x, T_i[1:N_x], COLOR=col
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

PRO ki_eval, ki, r_n_T, x, n_ie, T_ie, chi_ie, inv_2dx, T_sep, n_sep, P_ext

  N_x = N_ELEMENTS(ki)

  inner_term = FLTARR(N_x+2)
  FOR k = 0, N_x - 1 DO inner_term[k+1] = $
    x[k] * n_ie[k+1] * chi_ie[k] * (T_ie[k+1+1] - T_ie[k-1+1]) * inv_2dx
  apply_BCs, inner_term, chi_ie[N_x-1] * x[N_x-1] * n_sep * T_sep

  FOR k = 0, N_x - 1 DO ki[k] = $
    (2.0 / 3.0) * (inner_term[k+1] - inner_term[k-1+1]) * 2 * inv_2dx + $
    (2.0 / 3.0) * x[k] * P_ext[k]

END

PRO apply_BCs, a_dyn, adyn_sep

  N_x = N_ELEMENTS(a_dyn) - 2

  a_dyn[0] = a_dyn[1]
  a_dyn[N_x+1] = adyn_sep

END