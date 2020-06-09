R=5
Ecampo=10.*10.^( 12)
l=8
rho1 = linspace(5,10,15)
phi1=linspace(0,2.*pi,20)
[rho, phi]=meshgrid(rho1, phi1)
e=8.85.*10.^(-12)

potencial = -Ecampo.*rho.*(1-(R.^2)./(rho.^2)).*cos(phi);

surf(rho, phi, potencial)
title("Cilindro R=5")
xlabel("rho")
ylabel("phi")
zlabel("potencial")