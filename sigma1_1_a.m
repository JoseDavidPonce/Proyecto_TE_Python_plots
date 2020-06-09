a=2;
b=3;
i1=2
i2=5
i3=10
i4=20

y=linspace(0,3,200);
e=8.85.*10.^(-12);
function z = densi(i,a,b,y)
  sigmatotal = 0;
  for n = 1:i
    An = 1./(n.*pi.*sinh(n.*pi.*a./b)).*(cos(n.*pi).*((2.*b.^3)./(a.^3.*(n.*pi).^2)-atan(b./a)));
    sigma = -2.*pi.*e.*n./b.*An.*cosh(n.*pi.*a./b).*sin(n.*pi.*y./b);
    sigmatotal = sigma+sigmatotal;
  endfor
  z=sigmatotal;
endfunction
subplot(2,2,1)
plot(y,densi(i1,a,b,y))
title("n=2")
xlabel("y")
ylabel("Densidad de carga")

subplot(2,2,2)
plot(y,densi(i2,a,b,y))
title("n=5")
xlabel("y")
ylabel("Densidad de carga")

subplot(2,2,3)
plot(y,densi(i3,a,b,y))
title("n=10")
xlabel("y")
ylabel("Densidad de carga")

subplot(2,2,4)
plot(y,densi(i4,a,b,y))
title("n=20")
xlabel("y")
ylabel("Densidad de carga")

