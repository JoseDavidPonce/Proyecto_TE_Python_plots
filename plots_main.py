  
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import numpy as np
import sympy as sy
from sympy.abc import x,y
from numpy import exp,sinh,sin,cos,tan,arctan,pi




fig=plt.figure()
ax=Axes3D(fig)
a=3
b=1
N=20


x1=np.linspace(-b,a,1000)
y1=np.linspace(0,b,1000)
X, Y=np.meshgrid(x1,y1)


def Ponce(n,b):
    return sy.integrate((2*y**3+5)*sy.sin(n*pi*y/b),(y,0,b))


def An(n,a,b):
    return ((exp(n*pi)-exp(-n*pi*a/b))/(b*sinh(n*pi*(a/b+1))))*Ponce(n,b)

def Bn(n,a,b):
    return ((exp(n*pi)-exp(-n*pi*a/b))/(b*sinh(n*pi*(a/b+1))))*Ponce(n,b)

def z(x,y):
    Z=0
    for k in range(N):
        n=k+1
        Z=Z+(An(n,a,b)*exp(n*pi*x/b)+Bn(n,a,b)*exp(-n*pi*x/b))*sin(n*pi*y/b)
    return Z


ax.plot_surface(X,Y,z(X,Y))
plt.title("Voltaje n="+str(N))
plt.xlabel('X')
plt.ylabel('Y')
plt.show()