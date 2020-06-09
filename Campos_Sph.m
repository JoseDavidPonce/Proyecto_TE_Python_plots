
p=2
R=3;
a=2;
b=3;
e=1;
phicero=-5;
k=2;
r1=linspace(0,(2.*R).*(p==1)+(2.*b).*(p==2),15);
t1=linspace(0,pi,15);
phi1=linspace(0,2.*pi,15);
[r,t,phi]=meshgrid(r1,t1,phi1);

if p==1
  vr=(-(3)./(10.*e).*cos(t)+(18.*r.^2)./(35.*e.*R.^2).*(5.*(cos(t)).^3-3.*cos(t))).*(r<R)+((3.*R.^3)./(5.*e.*r.^2).*cos(t)-(24.*R.^5)./(35.*e.*r.^5).*(5.*(cos(t)).^3-3.*cos(t))).*(r>=R);
  vt=((3)./(10.*e).*sin(t)-(6.*r.^2)./(35.*e.*R.^2).*(15.*(cos(t)).^2.*sin(t)-3.*sin(t))).*(r<R)+((3.*R.^3)./(10.*e.*r.^3).*sin(t)-(6.*R.^5)./(35.*e.*r.^5).*(15.*(cos(t)).^2.*sin(t)-3.*sin(t))).*(r>=R);
  u=vr.*sin(t).*cos(phi)+vt.*cos(t).*cos(phi);
  v=vr.*sin(t).*sin(phi)+vt.*cos(t).*sin(phi);
  w=vr.*cos(t)+vt.*(-sin(t));
  
elseif p==2
  vr=(0).*(r<a)+((b.*k.*a)./(e.*r.^2)-(2.*k)./(15.*b.*e).*(2.*r+(3.*a.^5)./(r.^4)).*(3.*(cos(t)).^2-1)+(phicero.*a)./(r.^2)).*((r<b)&(r>=a))+(-(b.*k.*(b-a))./(e.*r.^2)+(2.*k.*(b.^5-a.^5))./(5.*b.*e.*r.^4)+(phicero.*a)./(r.^2)).*(r>=b);
  vt=(0).*(r<a)+(-(2.*k)./(15.*b.*e).*(r-(a.^5)./(r.^4)).*(6.*cos(t).*sin(t))).*((r<b)&(r>=a))+((4.*k.*(b.^5-a.^5).*cos(t).*sin(t))./(5.*b.*e)).*(r>=b);
  u=vr.*sin(t).*cos(phi)+vt.*cos(t).*cos(phi);
  v=vr.*sin(t).*sin(phi)+vt.*cos(t).*sin(phi);
  w=vr.*cos(t)+vt.*(-sin(t));
endif

[x,y,z]=sph2cart(t,phi,r);
quiver3(x,y,z,u,v,w,scale=1);

  

