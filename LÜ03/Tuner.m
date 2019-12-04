%% Loading Audio
% Laden der Audiodatei
[y, Samplefrequenz] = audioread('GitOneString.wav');

%% Deklartion von Variablen
% Signalnormierung
y_normiert = y/max(abs(y));

%Anzahl der Samples bestimmen
FileSize = length(y_normiert);

% Bestimmung der Messzeit T
T = FileSize / Samplefrequenz;

% Bestimmung der Frequenzauflösung DeltaF der FFT
DeltaF = 1 / T;

% Anlegen eines Frequenzvektor
fVek = 0:DeltaF:Samplefrequenz - 0.25;

% FFT durchführen
S=fft(y_normiert);

%% Playing Audio
%Abspielen des Originalsignals
sound(y_normiert, Samplefrequenz);

%% Plot
% Audisignal wird geplottet
subplot(2,1,1)
plot (y_normiert)     
title('Original')

% Absolutwert der FFT wird geplottet
subplot (2,1,2)
plot(fVek, abs(S))
title('Absolutwert der FFT')

