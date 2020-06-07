import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import numpy as np



def f(x):
    return np.sin(np.exp(-x**2))**2

T=99999
total=0
X=0
high=7
low=0


for i in range(T):
    d=(high-low)/T
    X=X+d
    total=total+f(X)*d
print(total)
