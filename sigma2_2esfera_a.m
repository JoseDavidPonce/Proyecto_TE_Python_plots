rho=5
k = 7
a = 5
b = 1
phicero = 60.*10.^(-12)

theta1=linspace(0,pi,100)
phi1=linspace(0,2.*pi,100)
[theta,phi]=meshgrid(theta1,phi1)
e=8.85.*10.^(-12)

[x,y,z]=sph2cart(theta,phi,rho)
neotheta=atan(sqrt(x.^2+y.^2)./(z))
sigma = (b.*k)./a-(2.*k.*a)./(3.*b).*(3.*(cos(neotheta)).^2-1)+phicero./(a.*e)

surf(x,y,z,sigma)
colorbar;
title("Esfera R=a")
xlabel("x")
ylabel("y")
zlabel("z")