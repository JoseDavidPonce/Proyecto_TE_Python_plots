rho=5

theta1=linspace(0,pi,100)
phi1=linspace(0,2.*pi,100)
[theta,phi]=meshgrid(theta1,phi1)
e=8.85.*10.^(-12)

[x,y,z]=sph2cart(theta,phi,rho)
neotheta=atan(sqrt(x.^2+y.^2)./(z))
sigma = 6./7.*(cos(neotheta)).^3-(123)./(350).*cos(neotheta)

surf(x,y,z,sigma)
colorbar;
title("Esfera R=5")
xlabel("x")
ylabel("y")
zlabel("z")