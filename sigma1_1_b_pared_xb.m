a=2;
b=3;
n=20;

y=linspace(0,3,200);
e=8.85.*10.^(-12);

integral = cos(n.*pi).*((2.*b.^3+5)./(n.*pi)+12.*b.^3./(n.*pi).^3)+5./(n.*pi)


An = 1./(n.*pi.*sinh(n.*pi.*a./b)).*(cos(n.*pi).*((2.*b.^3)./(a.^3.*(n.*pi).^2)-atan(b./a)))
sigma = e.*pi./b.*n.*(An.*exp(-n.*pi)-Bn.*exp(n.*pi)).*sin(n.*pi.*y./b)

plot(y,sigma)
xlabel("y")
ylabel("Densidad de carga")