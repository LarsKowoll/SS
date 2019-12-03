%% Laden der Audiodatei
[y, Samplefrequenz] = audioread('GitRiff02.wav');

% Signalnormierung
y_normiert = y/max(abs(y));

%% Anzahl der Samples bestimmen
FileSize = size(y_normiert, 1);

%Platz für Eergbnisvektor allokieren
%yDist = zeros(FileSize, 1);

%% Verzerrung des Signals
yy = GuitarDistortion(y_normiert, 1, 100);
DelayedAndDistorted = U3delay(yy, 0.2, 10000);

subplot(2,1,1), plot(yy);
subplot(2,1,2), plot(DelayedAndDistorted);
%sound(yy,Samplefrequenz);
%pause
 sound(DelayedAndDistorted,Samplefrequenz);
% Signalnormierung
%echo_normiert = echo/max(abs(echo));


%% Plot

x = [-1:0.01:1];

xGuitarDistortion0 = GuitarDistortion(x, 0, 2);
subplot(2,1,1), plot (xGuitarDistortion0)
title('Tangens Hyperbolicus')

xGuitarDistortion0 = GuitarDistortion(x, 1, 2);
subplot(2,1,2), plot (xGuitarDistortion0)
title('Bendisken')