a=2;
b=3;
i=20;
j=20;

y=linspace(0,3,300);
x=linspace(0,2,300);
e=8.85.*10.^(-12);
sigmatotal=0; %esto es el z

for m = 1:j
  for n = 1:i   %dos iteraciones
    integral = ;
    Cnm = 4./(a.*b).*integral;
    sigma = -e.*Cnm.*sqrt((m.*pi./a).^2+(n.*pi./b).^2).*sin(m.*pi.*x./a)sin(n.*pi.*y./b);
    sigmatotal= sigmatotal+sigma;
  endfor
endfor
plot(y,sigmatotal)
title("Pared x=-b")
xlabel("y")
ylabel("Densidad de carga")