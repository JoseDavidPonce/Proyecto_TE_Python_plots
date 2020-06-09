a=2;
b=3;
i1=2
i2=5
i3=10
i4=20

y=linspace(0,3,300);
e=8.85.*10.^(-12);
function z = densi(i,a,b,y)
  sigmatotal=0;
  for n = 1:i
    integral = cos(n.*pi).*((2.*b.^3+5)./(n.*pi)+12.*b.^3./(n.*pi).^3)+5./(n.*pi);
    An = (exp(n.*pi)-exp(n.*pi.*a./b))./(b.*sinh(n.*pi.*(a./b+1))).*integral;
    Bn = (exp(n.*pi.*a./b)-exp(-n.*pi))./(b.*sinh(n.*pi.*(a./b+1))).*integral;
    sigma = e.*pi./b.*n.*(An.*exp(-n.*pi)-Bn.*exp(n.*pi)).*sin(n.*pi.*y./b);
    sigmatotal= sigmatotal+sigma;
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