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

%% Orbit Parameters
h = 400. + b;  % km
month = mod(a, 10); % mes
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

omega_b = [n; 0e0; 0e0];  % rad/s
omega_i = c_bi' * omega_b;  % rad/s
omega0 = omega_i;  % rad/s
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

%% Simulation Parameters

tf = period_sc;  % s

%% Functions

function num = str2num(str)
num = sum(double(str)) + strlength(str) * (1 - double('A'));
end