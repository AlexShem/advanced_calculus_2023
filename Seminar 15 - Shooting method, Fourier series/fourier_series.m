%% Parameters
f_fun = @(x) -(mod(x + pi, 2*pi) - pi) / 2; % -x/2
df_fun = @(x) -.5*ones(size(x))';

x = linspace(-2*pi + 1e-6, 2*pi - 1e-6, 50001);
f = f_fun(x);
df = df_fun(x);

%% Computation
N = [10, 20, 40, 100];
for n = 1:length(N)
    f_series = 0;
    df_series = 0;
    for k = 1:N(n)
        f_series = f_series + (-1)^k * sin(k*x)/k;
        df_series = df_series + cos(k*x);
    end
    figure(n);

    subplot(2, 1, 1)
    plot(x, f, x, f_series);
    grid on;
    legend('$f(x)$', 'Fourier', interpreter = 'latex', fontsize = 12)
    title(['$n =$ ', num2str(N(n))], interpreter = 'latex', fontsize = 16)

    subplot(2, 1, 2)
    plot(x, df, x, df_series);
    grid on;
    legend('$\frac{df}{dx}(x)$', 'Fourier', interpreter = 'latex', fontsize = 12)
    xlabel('$x$', interpreter = 'latex', fontsize = 14)
end
