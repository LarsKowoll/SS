% Signal
s = [ 1 1 1 1   1 1 1 1     0 0 0 0     0 0 0 0     0 0 0 0     0 0 0 0      1 1 1 1   1 1 1 1];

S=fft(s);
A = real(S);
B = imag(S);

%% Plotting
plot(s, 'g')
hold on
plot(A, 'r')
hold on
plot(B, 'b')
title('DFT')
legend({'Ausgangssignal','Kosinusanteile', 'Sinusanteile'},'Location','EastOutside')
axis equal
axis tight