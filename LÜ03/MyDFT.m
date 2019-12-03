function [A, B] = MyDFT(Signal)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
M =  length(Signal);
A = zeros(1, M);
B = zeros(1, M);

    for k=0:M-1
        for n=0:M-1
            A(k+1)= A(k+1) + Signal(n+1)*cos(2*pi*(k/M)*n);
        end

    end
    
    for k=0:M-1
        for n=0:M-1
            B(k+1)= (B(k+1) + -1*(Signal(n+1)*sin(2*pi*(k/M)*n)));
        end

    end
%For testing
% A
% B
% S=fft(Signal);
% C = real(S);
% D = imag(S);
% C
% D
end

