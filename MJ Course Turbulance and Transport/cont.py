import numpy as np
import matplotlib.pyplot as plt

def fun(zreal,zimag):
    z=complex(zreal,zimag)
    return z+complex(0,0.2)*z-complex(0,-0.2)*z+complex(0.3,-0.5)

n=10
zreal = np.linspace(0,20,n)
zimag = np.linspace(0,20,n)

F = np.zeros((n,n))

for i in range(n):
    for j in range(n):
        F[i,j]=fun(zreal[i], zimag[j])

plt.plot(F)

# print(Z)

# fi = []
# for zi in z:
#     f = fun(zi)
#     fi.append(f)
#     plt.plot(f.real,f.imag,'.r')
#     print(f.real,f.imag)

# plt.show()