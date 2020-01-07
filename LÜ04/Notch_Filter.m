%% Aufgabe 4.4
% Notch-Filter
%% Load Files
file = './GitRiff_880Hz.wav';
[s1, fS] = audioread(file);
load('Notch');

%% Filter
s2 = filter(Notch,Den,s1);

%% Norming
s2 = s2 / max(abs(s2));

%% Plotting
subplot(2, 1, 1);
plot(s1);
subplot(2, 1, 2);
plot(s2, 'r');
grid on;
title('filtered');

%% Sound
sound(s1, fS);
pause();
sound(s2, fS);