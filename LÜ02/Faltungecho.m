% Echomatrix
%       Position in sek, Echohöhe
Echos =        [0       1.0;
                %0.2     1; %test für variable length
                0.3     0.3;
                0.5     0.2;
                0.7     0.1;
                0.75    0.1];
           
%% load GetRiff in vektor s
[s, Samplefrequenz] = audioread('GitRiff.wav');

%% Normalisierung
s = s/max(abs(s));

%% Get Position and Echo Daata
positionen = Echos(:,1);
echoheight = Echos(:,2);

%% Create Echo Matrix

%uint16 zum aufrunden.
letzteStelle = uint16(max(positionen)*Samplefrequenz);

%+1, da arrays mit 1 starten
echomatrix = zeros(1+letzteStelle,1);

length(positionen)

for i=1:1:length(positionen)
    %+1, da arrays mit 1 starten
    pos = 1+(uint16(positionen(i)*Samplefrequenz));
    echomatrix(pos) = echoheight(i);
end

%% Faltung
g = conv(s,echomatrix);

%% Sound
sound(s,Samplefrequenz);
pause
sound(g,Samplefrequenz);