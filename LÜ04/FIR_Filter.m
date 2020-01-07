%% Aufgabe 1
% Hamming Filter
%% Declare Variables
fS = 44100;
select = 3;

%% Select 1
file = './ACDClike.wav';
[select1, fs] = audioread(file);

%% Select 2
tStart = 0;  fStart = 50;
tStop  = 5;  fStop  = 5000;
FSample = fS;  TSample = 1 / FSample;

% allocate memory
t = tStart:TSample:tStop;

select2 = chirp(t, fStart, tStop, fStop, 'logarithmic');

%% Select 3
a = rand(1,fS*5);
select3 = a;

%% Select 4
t = 0: 1/fS : 1 ;
d = 0 : 1/20 : 1;
select4 = pulstran(t,d,'rectpuls',0.005);

%% Switch Statement
s1 = 0;
switch select
    case 1 
        s1 = select1;
    case 2
        s1 = select2;
    case 3 
        s1 = select3;
    case 4
        s1 = select4;
end
%% Filter
load('FIR_1500_40dB');
s2 = filter(FIR_1500_40dB,1,s1);
s2 = s2 / max(abs(s2));

%% Plotting
subplot(2, 1, 1);
plot(s1);
title('Original');
subplot(2, 1, 2);
plot(s2);
grid on;
title('Mit Filter');

%% Sound
sound(s1,fs);
pause();
sound(s2,fS);