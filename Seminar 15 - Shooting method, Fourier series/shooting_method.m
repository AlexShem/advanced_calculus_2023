%% Parameters
r = @(x) -1;
dr = @(x) 0;
q = @(x) x.^2 + 1;
g = @(x) exp(x/2).*(x.^2 + .75);

X = 1;
u0_val = 1;
uX_val = exp(X/2);

du0 = linspace(0, 1, 21);

%% Integration
filename = 'animation_shooting.gif';

figure(1);
for k = 1 : length(du0) + 1
    if k < length(du0) + 1
        z0 = [u0_val, du0(k)];
        [x, Z] = ode45(@(x, u) syst_fun(x, u, r, dr, q, g), [0 X], z0);
        plot(x, Z(:, 1), '--k');
        hold on;
        xlabel('x');
        scatter(X, uX_val, 'red', 'fill')
        axis([0 X 1 2.2]);
    else
        plot(x, exp(x/2), '-r', LineWidth = 1.5)
    end

    drawnow;
    frame = getframe(1);
    im = frame2im(frame);
    [A, map] = rgb2ind(im, 256);
    if k == 1
        imwrite(A, map, filename, 'gif', 'LoopCount', 1, 'DelayTime', 0.001);
    else
        imwrite(A, map, filename, 'gif', 'WriteMode', 'append', 'DelayTime', 0.1);
    end
end
hold off;

%% System
function dz = syst_fun(x, z, r, dr, q, g)
dz = [z(2);
    (g(x) - dr(x).*z(2) - q(x).*z(1))./r(x)];
end
