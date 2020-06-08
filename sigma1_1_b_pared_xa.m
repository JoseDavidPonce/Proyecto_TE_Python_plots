a=2;
b=3;
i=20;

y=linspace(0,3,300);
e=8.85.*10.^(-12);
sigmatotal=0;

for n = 1:i
  integral = cos(n.*pi).*((2.*b.^3+5)./(n.*pi)+12.*b.^3./(n.*pi).^3)+5./(n.*pi);
  An = (exp(n.*pi)-exp(n.*pi.*a./b))./(b.*sinh(n.*pi.*(a./b+1))).*integral;
  Bn = (exp(n.*pi.*a./b)-exp(-n.*pi))./(b.*sinh(n.*pi.*(a./b+1))).*integral;
  sigma = -e.*pi./b.*n.*(An.*exp(n.*pi.*a./b)-Bn.*exp(-n.*pi.*a./b)).*sin(n.*pi.*y./b);
  sigmatotal= sigmatotal+sigma;
endfor
plot(y,sigmatotal)
title("Pared x=-b")
xlabel("y")
ylabel("Densidad de carga")