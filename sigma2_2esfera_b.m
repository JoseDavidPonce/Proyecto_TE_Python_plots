rho=5
k = 7
a = 5
b = 10
phicero = 60.*10.^(-12)

theta1=linspace(0,pi,100)
phi1=linspace(0,2.*pi,100)
[theta,phi]=meshgrid(theta1,phi1)
e=8.85.*10.^(-12)

[x,y,z]=sph2cart(theta,phi,rho)
neotheta=atan(sqrt(x.^2+y.^2)./(z))
sigma = ((k.*(2.*a-b))./(b)-(2.*k)./(15).*(2+(3.*a.^5)./(b.^5)).*(3.*(cos(neotheta)).^2-1)+(2.*phicero.*a)./(b.^2))

surf(x,y,z,sigma)
colorbar;
title("Esfera R=b")
xlabel("x")
ylabel("y")
zlabel("z")