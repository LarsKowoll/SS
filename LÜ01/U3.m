% Laden der Audiodatei
[y, Samplefrequenz] = audioread('GitRiff02.wav');

% Signalnormierung
y_normiert = y/max(abs(y));

%Anzahl der Samples bestimmen
FileSize = size(y_normiert, 1);

%Platz für Eergbnisvektor allokieren
%yDist = zeros(FileSize, 1);

%Verzerrung des Signals
yy = GuitarDistortion(y_normiert, 1, 100);

%Echo des Sginals
h = [1, zeros(1, 0.5*Samplefrequenz), 0.5, zeros(1, 0.5*Samplefrequenz)];
subplot(3,1,1), plot (h)
echo =conv(yy, h);
%Originalsignal wird geplottet
subplot(3,1,2), plot (y_normiert)
y1 = ylim;        %gets current limits
title('Original')

% Signalnormierung
echo_normiert = echo/max(abs(echo));

%Abspielen des veraenderten Signals 
sound(echo_normiert, Samplefrequenz);

x = [-1:0.01:1];

xGuitarDistortion0 = GuitarDistortion(x, 0, 2);
subplot(2,1,1), plot (xGuitarDistortion0)
title('Tangens Hyperbolicus')

xGuitarDistortion0 = GuitarDistortion(x, 1, 2);
subplot(2,1,2), plot (xGuitarDistortion0)
title('Bendisken')