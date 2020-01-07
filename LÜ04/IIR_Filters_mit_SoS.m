%% Aufgabe 2
% IIR-Filter mit Second-order-Sections
%% Declare Variables Hamming Filter
fS = 44100;
select = 2;

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
load('IIR_1500_80dB');
s2 = sosfilt(IIR_1500_80dB,s1);

%% Aufgabe 4.3
% load('IIR_1400_40dB');
% s2 = my_sosfilt(IIR_1400_40dB, s1);
%% Plotting
s2 = s2 / max(abs(s2));
%s1 = s1 ./ abs(s1);

subplot(2, 1, 1);
plot(s1);
subplot(2, 1, 2);
plot(s2,'r');
grid on;
title('filtered');

%% Sound
sound(s1,fS);
pause();
sound(s2,fS);




