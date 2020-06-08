a=2;
b=3;
i=20;
j=20;

y1=linspace(0,3,100);
x1=linspace(0,2,100);
[x,y]=meshgrid(x1,y1);
e=8.85.*10.^(-12);
sigmatotal=0; %esto es el z

for m = 1:j
  for n = 1:i   %dos iteraciones
    integral = (4.*a.*b.^2.*(-1).^(m+1))./(m.*n.*pi.^2).*(cos(n.*pi).*(-1+2./((n.*pi).^2))-2./((n.*pi).^2));
    Cnm = 4./(a.*b).*integral;
    sigma = -e.*Cnm.*sqrt((m.*pi./a).^2+(n.*pi./b).^2).*sin(m.*pi.*x./a).*sin(n.*pi.*y./b);
    sigmatotal= sigmatotal+sigma;
  endfor
endfor

surf(x,y,sigmatotal)
title("Pared z=0")
xlabel("x")
ylabel("y")
zlabel("Densidad de carga")