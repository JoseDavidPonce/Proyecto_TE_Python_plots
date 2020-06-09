a=2;
b=3;
problema=2
N1=2;
N2=5;
N3=10;
N4=20;
x1=linspace((0).*(problema==1.1)+(-b).*(problema==1.2)+(-3.*a).*(problema==2),a,100);
y1=linspace(0,b,100);
[x,y]=meshgrid(x1,y1);

function  Z=graf(N,b,a,problema,x,y)
  V=0
  for n=1:N
    integral=quad(@(y)((2.*y.^3+5).*(problema==1.2|problema==2)+(atan(y/a)).*(problema==1.1)).*(sin(n.*pi.*y./b)),0,b);
    An = ((exp(n.*pi)-exp(n.*pi.*a./b))./(b.*sinh(n.*pi.*(a./b+1))).*(problema==1.2)+
    (1./(b.*sinh(n.*pi.*a./b))).*(problema==1.1)+
    (2./(b.*exp(n.*pi.*a./b))).*(problema==2)).*integral;
    Bn = ((exp(n.*pi.*a./b)-exp(-n.*pi))./(b.*sinh(n.*pi.*(a./b+1))).*(problema==1.2)).*integral;
    V=V+sin(n*pi*y/b).*(An.*(exp(n*pi*x/b).*(problema==1.2|problema==2)+(sinh(n.*pi.*x./b)).*(problema==1.1))+Bn.*exp(-n*pi*x/b));
  endfor
  Z=V;
endfunction

subplot(2,2,1)
surf(x,y,graf(N1,b,a,problema,x,y))
title("n=2")
xlabel("X")
ylabel("Y")
zlabel("Potencial Electrico")
subplot(2,2,2)
surf(x,y,graf(N2,b,a,problema,x,y))
title("n=5")
xlabel("X")
ylabel("Y")
zlabel("Potencial Electrico")
subplot(2,2,3)
surf(x,y,graf(N3,b,a,problema,x,y))
title("n=10")
xlabel("X")
ylabel("Y")
zlabel("Potencial Electrico")
subplot(2,2,4)
surf(x,y,graf(N4,b,a,problema,x,y))
title("n=20")
xlabel("X")
ylabel("Y")
zlabel("Potencial Electrico")