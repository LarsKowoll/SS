% Signal
s = [ 1 1 1 1   1 1 1 1     0 0 0 0     0 0 0 0     0 0 0 0     0 0 0 0      1 1 1 1   1 1 1 1];

[A, B] = MyDFT(s);

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