function q = TRIAD_QUATERNION(ub, vb, ui, vi)

ub_norm = ub/norm(ub);
vb_norm = vb/norm(vb);

t1b = ub_norm;
t2b = cross(ub_norm,vb_norm);
t3b = cross(t1b,t2b);


ui_norm = ui/norm(ui);
vi_norm = vi/norm(vi);

t1i = ui_norm;
t2i = cross(ui_norm,vi_norm);
t3i = cross(t1i,t2i);

Cbi = [t1b', t2b', t3b']*[t1i', t2i', t3i']';

phi = acos(0.5*(Cbi(1,1) + Cbi(2,2) + Cbi(3,3) -1));
e = 1/(2*sin(phi))*[Cbi(2,3)-Cbi(3,2), Cbi(3,1) - Cbi(1,3), Cbi(1,2) - Cbi(2,1)];

q = [e(1),e(2),e(3),1/tan(phi/2)]*sin(phi/2);

end