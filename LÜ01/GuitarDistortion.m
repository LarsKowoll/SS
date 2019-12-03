function [y] = GuitarDistortion(x, Typ, D)
%UNTITLED Summary of this function goes here
%   x = Eingangssignal
%   Typ = Distortion-Typ 0 für Tangens Hyperbolicus, 1 nach Bendisken
%   D = Distortionstaerke
    if Typ == 0
        y = tanh(D*x);
    elseif Typ == 1
        z = D*x;
        y = -sign(-z) .* (1-exp(sign(-z).*z));
    end
end

