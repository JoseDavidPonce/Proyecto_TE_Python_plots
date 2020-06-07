import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import numpy as np
import sympy as sy
from sympy.abc import x




fig=plt.figure()
ax=Axes3D(fig)
x=np.linspace(0,3,1000)
y=np.linspace(0,2,1000)
X, Y=np.meshgrid(x,y)
a=3
b=2
n=20
    
def An(n,a,b):
    return (1/(n*np.pi*np.sinh(n*np.pi*a/b)))*np.cos(n*np.pi)*((2*b**3)/((a**3)*(n*np.pi)**2)-np.arctan(b/a))


def z(x,y):
    Z=0
    for k in range(n):
        Z=Z+2*An(k+1,a,b)*np.sinh((k+1)*np.pi*x/b)*np.sin((k+1)*np.pi*y/b)
    return Z


ax.plot_surface(X,Y,z(X,Y))
plt.title("Voltaje n="+str(n))
plt.xlabel('X')
plt.ylabel('Y')
plt.show()

