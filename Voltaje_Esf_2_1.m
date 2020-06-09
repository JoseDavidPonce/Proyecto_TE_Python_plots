R=3;
r1=linspace(0,2.*R,100);
z1=linspace(0,pi,100);
e=8.85.*10.^(-12);
[r,z]=meshgrid(r1,z1);
V = ((((3.*r)./(10.*e)).*cos(z)).-((6.*r.^3)./(35.*e.*R.^2)).*(5.*cos(z).^3-3.*cos(z))).*(r<R)+(((3.*R.^3)./(10.*e.*(r.^2))).*cos(z)-((6.*(R.^5))./(35.*e.*(r.^4))).*(5.*cos(z).^3-3.*cos(z))).*(r>=R);
surf(z,r,V)
xlabel("r")
ylabel("Theta")
zlabel("Voltaje")

