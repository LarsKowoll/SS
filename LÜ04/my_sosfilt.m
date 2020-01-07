function c = my_sosfilt(IIR_Vec,sVec)
leng=length(sVec);
c = zeros(1,leng);
x1k1=0;
x1k=0;
x2k=0;
x2k1=sVec(1);
g=IIR_Vec(1)*x2k1;
 c(1) =g;
for i = 2 : leng
    % Second-order-section
    x1k1 = x2k;
    x2k1 = -IIR_Vec(6)*x1k - IIR_Vec(5)*x2k + sVec(i);
    % Ausgabe
    g = +IIR_Vec(1)*x2k1 + IIR_Vec(2)*x2k + IIR_Vec(3)*x1k;
    % Weiterschieben
    x1k = x1k1; % Verzögerungselement
    x2k = x2k1; % Verzögerungselement
    c(i) = g;
end


  