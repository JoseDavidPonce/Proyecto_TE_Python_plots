a=2;
b=3;
i=20;

y=linspace(0,3,200);
e=8.85.*10.^(-12);
sigmatotal = 0;
for n = 1:i
  An = 1./(n.*pi.*sinh(n.*pi.*a./b)).*(cos(n.*pi).*((2.*b.^3)./(a.^3.*(n.*pi).^2)-atan(b./a)));
  sigma = -2.*pi.*e.*n./b.*An.*cosh(n.*pi.*a./b).*sin(n.*pi.*y./b);
  sigmatotal = sigma+sigmatotal;
endfor

title("Pared x=a")
plot(y,sigmatotal)
xlabel("y")
ylabel("Densidad de carga")
