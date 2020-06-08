rho=5
Ecampo=10.*10.^( 12)
l=8

z1=linspace(-l./2,l./2,100)
phi1=linspace(0,2.*pi,100)
[phi,z]=meshgrid(phi1,z1)
e=8.85.*10.^(-12)

[x,y,z]=pol2cart(phi,rho,z)
neophi=atan(y./x)
sigma = 2.*e.*Ecampo.*cos(neophi);

surf(x,y,z,sigma)
colorbar;
title("Cilindro R=5")
xlabel("x")
ylabel("y")
zlabel("z")