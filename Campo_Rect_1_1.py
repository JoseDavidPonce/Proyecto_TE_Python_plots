from mpl_toolkits.mplot3d import axes3d
import matplotlib.pyplot as plt
import numpy as np

fig = plt.figure()
ax = fig.gca()

a=3
b=2
N=10


x, y = np.meshgrid(np.arange(0, a, 0.4),
                         np.arange(0, b, 0.4))

def An(n,a,b):
    return (1/(n*np.pi*np.sinh(n*np.pi*a/b)))*np.cos(n*np.pi)*((2*b**3)/((a**3)*(n*np.pi)**2)-np.arctan(b/a))

u=0
v=0
for k in range(N):
    n=k+1
    u=u-2*np.pi/b*n*An(n,a,b)*np.cosh(n*np.pi*x/b)*np.sin(n*np.pi*y/b)
    v=v-2*np.pi/b*n*An(n,a,b)*np.sinh(n*np.pi*x/b)*np.cos(n*np.pi*y/b)

ax.quiver(x, y, u, v)
plt.title("Campo Electrico n="+str(n))
plt.xlabel('X')
plt.ylabel('Y')
plt.show()
