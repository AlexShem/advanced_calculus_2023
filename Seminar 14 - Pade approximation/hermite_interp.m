function P = hermite_interp(x, a, b, vals)
Pa = vals(1);
dPa = vals(2);
Pb= vals(3);
dPb = vals(4);
h = b-a;

ca = (dPa*h + 2*Pa)/h^3;
da = Pa/h^2;
cb = (dPb*h - 2*Pb)/h^3;
db = Pb/h^2;

P = ca*(x-a).*(x-b).^2 + da*(x-b).^2 +...
    cb*(x-a).^2.*(x-b) + db*(x-a).^2;
