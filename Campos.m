#Probando campos electricos
a=2
b=3
N1=2
N2=5
N3=10
N4=20

problema=1.1
x1=linspace((0).*(problema==1.1)+(-b).*(problema==1.2)+(-3.*a).*(problema==2),a,30);
y1=linspace(0,b,30);
[x,y]=meshgrid(x1,y1);

function [u,v]=vect(N,b,a,problema,x,y)
  U=0
  V=0
  for n=1:N
    integral=quad(@(y)((2.*y.^3+5).*(problema==1.2|problema==2)+(atan(y/a)).*(problema==1.1)).*(sin(n.*pi.*y./b)),0,b);
    An = ((exp(n.*pi)-exp(n.*pi.*a./b))./(b.*sinh(n.*pi.*(a./b+1))).*(problema==1.2)+
    (1./(b.*sinh(n.*pi.*a./b))).*(problema==1.1)+
    (2./(b.*exp(n.*pi.*a./b))).*(problema==2)).*integral;
    Bn = ((exp(n.*pi.*a./b)-exp(-n.*pi))./(b.*sinh(n.*pi.*(a./b+1))).*(problema==1.2)).*integral;
    U=U+(-2.*pi./b.*n.*An.*cosh(n.*pi.*x./b).*sin(n.*pi.*y./b)).*(problema==1.1)+(-pi./b.*n.*(An.*exp(n.*pi.*x./b)-Bn.*exp(-n.*pi.*x./b)).*sin(n.*pi.*y./b)).*(problema==1.2)+(-pi./b.*n.*An.*exp(n.*pi.*x./b).*sin(n.*pi.*y./b)).*(problema==2);
    V=V+(-2.*pi./b.*n.*An.*sinh(n.*pi.*x./b).*cos(n.*pi.*y./b)).*(problema==1.1)+(-pi./b.*n.*(An.*exp(n.*pi.*x./b)-Bn.*exp(-n.*pi.*x./b)).*cos(n.*pi.*y./b)).*(problema==1.2)+(-pi./b.*n.*An.*exp(n.*pi.*x./b).*cos(n.*pi.*y./b)).*(problema==2);
  endfor
  v=V;
  u=U;
endfunction

subplot(2,2,1)
[u,v]=vect(N1,b,a,problema,x,y,scale=5);
quiver(x,y,u,v)
title("n=2")
xlabel("X")
ylabel("Y")

subplot(2,2,2)
[u,v]=vect(N2,b,a,problema,x,y,scale=5);
quiver(x,y,u,v)
title("n=5")
xlabel("X")
ylabel("Y")

subplot(2,2,3)
[u,v]=vect(N3,b,a,problema,x,y,scale=5);
quiver(x,y,u,v)
title("n=10")
xlabel("X")
ylabel("Y")

subplot(2,2,4)
[u,v]=vect(N4,b,a,problema,x,y,scale=5);
quiver(x,y,u,v)
title("n=20")
xlabel("X")
ylabel("Y")