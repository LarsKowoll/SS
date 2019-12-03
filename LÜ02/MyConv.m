function [w] = MyConv(s_Vek,h_Vek)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
m = size(s_Vek, 1);
n = size(h_Vek, 1);
s = s_Vek;
h = h_Vek;
w = zeros(m+n-1 ,1);

for k=1:m +n -1
    for j = max(1,k+1-n): min(k,m)
            w(k) = w(k) + ( s(j)*h(k+1 - j) );  
    end
end
end

