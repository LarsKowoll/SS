%% Deklarieren der Variablen

fS = 10000;     % Abtastfrequenz
%fS = 6000;     % Abtastfrequenz
TS = 1/fS;      % Abtastintervall

FreqVek = [500 1000 1500 2000 2500 3000 3500 4000 4500];

t = 0:TS:0.5;   % 0.5s Signalabschnitt
n = length(FreqVek);

%% Laden der Audiodatei
FreqVekGesamt = [];
for i = 1:n
    FreqVekTemp = cos(2*pi*FreqVek(i)*t);
    FreqVekGesamt = [FreqVekGesamt FreqVekTemp];
end

plot(FreqVekGesamt);
sound(FreqVekGesamt, fS);
