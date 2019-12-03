% Laden der Audiodatei
[y, Samplefrequenz] = audioread('JetztGehtsLos.wav');

% Signalnormierung
y_normiert = y/max(abs(y));

%Anzahl der Samples bestimmen
FileSize = size(y_normiert, 1);

%Platz für Eergbnisvektor allokieren
%yDist = zeros(FileSize, 1);

%Signalbearbeitung mit MA k soll fuer 10,50 und 250 eingesetzt werden
yy = movmean(y_normiert,50);

%Originalsignal wird geplottet
subplot(2,1,1), plot (y_normiert)
y1 = ylim;        %gets current limits
title('Original')

%Veraendertes Signal mit dem MA-Filter wird geplottet
subplot (2,1,2), plot(yy)
% ylim(y1);  %sets limits to that of first subplot
title('Mit MA-Filter')

%Abspielen des Originalsignals
sound(y_normiert, Samplefrequenz);

%pause

%Abspielen des veraenderten Signals 
sound(yy, Samplefrequenz);