%% Laden der Audiodatei
[y, SamplefrequenzGit] = audioread('GitRiff.wav');

% Signalnormierung
y_normiert = y/max(abs(y));

%% Laden der Audiodatei
[x, SamplefrequenzTrig] = audioread('TrigRoom2.wav');

% Signalnormierung
x_normiert = x/max(abs(x));

%% Anzahl der Samples bestimmen
FileSizeGit = size(y_normiert, 1);

FileSizeTrig = size(x_normiert, 1);

%Platz für Eergbnisvektor allokieren
%yDist = zeros(FileSize, 1)

%% Faltung des Signals

echoMyConv = MyConv(y_normiert, x_normiert);

echoConv = conv(y_normiert, x_normiert);

%% Ergebnis Normalisieren
echoMyConv_normiert = echoMyConv/max(abs(echoMyConv));

echoConv_normiert = echoConv/max(abs(echoConv));

%% Audiosausgabe
sound(y, SamplefrequenzGit)

pause

sound(echoMyConv_normiert, SamplefrequenzGit)

pause

sound(echoConv_normiert, SamplefrequenzGit)