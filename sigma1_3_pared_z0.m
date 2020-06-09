a=2;
b=3;
i1=2
i2=5
i3=10
i4=20

j1=2
j2=5
j3=10
j4=20

y1=linspace(0,3,100);
x1=linspace(0,2,100);
[x,y]=meshgrid(x1,y1);
e=8.85.*10.^(-12);
function z=densi(i,j,a,b,x,y)
  sigmatotal=0; %esto es el z
  for m = 1:j
    for n = 1:i   %dos iteraciones
      integral = (4.*a.*b.^2.*(-1).^(m+1))./(m.*n.*pi.^2).*(cos(n.*pi).*(-1+2./((n.*pi).^2))-2./((n.*pi).^2));
      Cnm = 4./(a.*b).*integral;
      sigma = -e.*Cnm.*sqrt((m.*pi./a).^2+(n.*pi./b).^2).*sin(m.*pi.*x./a).*sin(n.*pi.*y./b);
      sigmatotal= sigmatotal+sigma;
    endfor
  endfor
  z = sigmatotal;
endfunction
subplot(2,2,1)
surf(x,y,densi(i1,j1,a,b,x,y))
xlabel("x")
ylabel("y")
zlabel("Densidad de carga")
title("n=2")

subplot(2,2,2)
surf(x,y,densi(i2,j2,a,b,x,y))
xlabel("x")
ylabel("y")
zlabel("Densidad de carga")
title("n=5")

subplot(2,2,3)
surf(x,y,densi(i3,j3,a,b,x,y))
xlabel("x")
ylabel("y")
zlabel("Densidad de carga")
title("n=10")

subplot(2,2,4)
surf(x,y,densi(i4,j4,a,b,x,y))
xlabel("x")
ylabel("y")
zlabel("Densidad de carga")
title("n=20")