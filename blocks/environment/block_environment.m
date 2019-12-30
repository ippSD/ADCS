clear, clc
%%%%5
i=46;
raan=52;
rt=6378;
r=400+raan+rt;
period=5617;
ta=359.915; %from stk

%%%%

d=juliandate([2018,6,1,12,0,0]);
ut=12;
T=(d+ut/24-2451545)/36525;

L=mod(280.46+36000.77*T,360);
G=mod(357.528+35999.05*T,360);
lambda=L+1.915*sind(G)+0.02*sind(2*G);
epsilon=23.4393-0.013*T;

E=-1.915*sind(G)-0.02*sind(2*G)+2.4466*sind(2*lambda)-0.053*sind(4*lambda);
GHA=15*ut-180+E;
delta=asind(sind(epsilon)*sind(lambda));
alfa=69;
g2=alfa+GHA;
SD=0.267/(1-0.017*cosd(G));
g1=[cosd(delta) 0 -sind(delta); 0 1 0;sind(delta) 0 cosd(delta)];
g2=[cosd(g2) -sind(g2) 0;sind(g2) cosd(g2) 0; 0 0 1];
v=g1*g2*[1; 0 ;0];
%%%%%%%%%%%%%%
R=([cosd(raan) -sind(raan) 0; sind(raan) cosd(raan) 0; 0 0 1]*[1 0 0; 0 cosd(i) -sind(i);0 sind(i) cosd(i)]);
C_opf=R';
C_opr=[ cosd(ta) sind(ta) 0; -sind(ta) cosd(ta) 0; 0 0 1];
C_lv=[0 1 0;0 0 -1;-1 0 0];
r_lv=[0;0;r];
ne_body=C_opf*C_opr*C_lv*r_lv;
ne_body=ne_body/norm(ne_body)
ns_body=v+ne_body
%%%%%%%%%%%%%%%%%%%%%%
a=asind(rt/r);
es=180+(90-a);
ee=360-(90-a);
eclipse=[es, ee]