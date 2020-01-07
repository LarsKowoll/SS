M = 256;    % Anzahl der Abtastwerte
F = 1;   % Frequenz des cos-Signals

% Signalerzeugung
t = 0:M-1;
x = cos(2*pi*F*t/M);


X = fft(x);
X_normiert = X/max(abs(X));

A = real(X_normiert);
B = imag(X_normiert);
Absolut = abs(X_normiert);

%% Ploting
% Ploting x(n)
subplot(3,1,1);
plot(x);
title('Ausgangssignal x(n)')

% Ploting Real- und Imaginaerteil von X
subplot(3,1,2);

plot(A);
hold on
plot(B);
title('Real- und Imaginaerteil von X')
legend({'Kosinusanteile', 'Sinusanteile'},'Location','EastOutside')

% Absolutbetrag von X
subplot(3,1,3);
plot(Absolut);
title('Absolutbetrag von X')
