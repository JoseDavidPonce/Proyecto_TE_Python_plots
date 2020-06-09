a=2
b=3
N1=2
N2=5
N3=10
N4=20

x1=linspace(0,a,30);
y1=linspace(0,b,30);
z1=linspace(-b,0,30);
[x,y,z]=meshgrid(x1,y1,z1);

function [u,v,w]=vect(N,M,b,a,x,y,z)
  U=0
  V=0
  W=0
  for n=1:N
    for m=1:M
      integraly=quad(@(y)(y.^2).*(sin(n.*pi.*y./b)),0,b);
      integralx=quad(@(x)(x).*(sin(m.*pi.*x./a)),0,a);
      Cnm = (4./(a.*b)).*integraly.*integralx;
      l=n.*pi./b;
      k=m.*pi./a;
      U=U+(-Cnm.*m.*pi./a.*exp(-z.*sqrt(k.^2+l.^2)).*cos(m.*pi.*x./a).*sin(n.*pi.*y./b));
      V=V+(-Cnm.*n.*pi./b.*exp(-z.*sqrt(k.^2+l.^2)).*sin(m.*pi.*x./a).*cos(n.*pi.*y./b));
      W=W+(Cnm.*sqrt(k.^2+l.^2).*exp(-z.*sqrt(k.^2+l.^2)).*sin(m.*pi.*x./a).*sin(n.*pi.*y./b));
     endfor
  endfor
  v=V;
  u=U;
  w=W;
endfunction

subplot(2,2,1)
[u,v,w]=vect(N1,N1,b,a,x,y,z);
quiver3(x,y,z,u,v,w)
title("n=m=2")
xlabel("X")
ylabel("Y")
zlabel("Z")

subplot(2,2,2)
[u,v,w]=vect(N2,N2,b,a,x,y,z);
quiver3(x,y,z,u,v,w)
title("n=m=5")
xlabel("X")
ylabel("Y")
zlabel("Z")

subplot(2,2,3)
[u,v,w]=vect(N3,N3,b,a,x,y,z);
quiver3(x,y,z,u,v,w)
title("n=m=10")
xlabel("X")
ylabel("Y")
zlabel("Z")

subplot(2,2,4)
[u,v,w]=vect(N4,N4,b,a,x,y,z);
quiver3(x,y,z,u,v,w)
title("n=m=20")
xlabel("X")
ylabel("Y")
zlabel("Z")