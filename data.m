%% Constants

RP = 6378.0;  % km
MU = 3.986e5;  % km^3/s^2
PERIOD_EARTH = 23e0 * 3600. + 56e0 * 60e0;  % s
OMEGA_EARTH = 2e0 * pi / PERIOD_EARTH;  % rad/s

%% Problem Parameters

inertia = [0.035, 0., 0.; 0., 0.02, 0.; 0., 0., 0.05];

%% Group Parameters

a = str2num('BSPI');
b = str2num('BMRS');
month = mod(a, 10); % mes
julian_date = juliandate([2018,month,1,12,0,0]);
ut = 12;

%% Orbit Parameters
h = 400. + b;  % km
inc = a; % deg
raan = b; % deg
nu_0 = 0e0;  % deg
arp = 0e0;  % deg
r = RP + h;  % km

n = sqrt(MU / r ^ 3);  % rad/s
period_sc = 2e0 * pi / n;  % s

lambda_0 = 0e0;  % deg

%% Mod
%raan = 0e0;  % deg
%inc = 0e0;  % deg

%% SCI -> Body Coord. Sys. Transformation Matrix

r_raan = [cosd(raan), sind(raan), 0e0; -sind(raan), cosd(raan), 0e0; 0e0, 0e0, 1e0];
r_incc = [1e0, 0e0, 0e0; 0e0, cosd(inc), sind(inc); 0e0, -sind(inc), cosd(inc)];

c_oi = r_incc * r_raan;

r_bo = [0e0, 0e0, -1e0; 0e0, 1e0, 0e0; 1e0, 0e0, 0e0];

c_bi = r_bo * c_oi;

%% Initial Angular Velocity

omega_b = -[n; 0e0; 0e0];  % rad/s
omega_i = c_bi' * omega_b;  % rad/s
omega_0 = omega_i;  % rad/s
omega_d = omega_i;  % rad/s


%% Initial Quternion

q0 = zeros(4, 1);
phi = acos(5e-1 * (trace(c_bi) - 1e0));
s_p = sin(phi);
c_p = cos(phi);
q0(1) = (c_bi(2,3) - c_bi(3,2)) / (2e0 * s_p) * sin(phi / 2e0);
q0(2) = (c_bi(3,1) - c_bi(1,3)) / (2e0 * s_p) * sin(phi / 2e0);
q0(3) = (c_bi(1,2) - c_bi(2,1)) / (2e0 * s_p) * sin(phi / 2e0);
q0(4) = cos(phi/2e0);

%% Bianca's ephem data

%clear, clc
%%%%5
i=inc;
%raan=raan;
rt=RP;
%r=r;
period=period_sc;
ta=0e0;

%%%%

d=julian_date;
%ut=ut;
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
ne_body=ne_body/norm(ne_body);
ns_body=v+ne_body;
%%%%%%%%%%%%%%%%%%%%%%
aa=asind(rt/r);
es=180+(90-aa);
ee=360-(90-aa);
eclipse=[es, ee];

%% Simulation Parameters

tf = period_sc;  % s

%% Functions

function num = str2num(str)
num = sum(double(str)) + strlength(str) * (1 - double('A'));
end