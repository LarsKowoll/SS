function [mittelwert] = U1mittelwertK(vectorY,k)

%If zeilenvektor 

if size(vectorY,1) == 1 && size(vectorY,2)>=1
    vectorY = vectorY';
end

FileSize = size(vectorY,1);
mittelwert= zeros(FileSize,0);
    for s=1:1:size(vectorY,2)
        Spalte = vectorY(:,s)';%spaltendurchlauf
        for i=1:1:length(vectorY)-k+1 %boundary check
            tempvalue = 0;
            for x=1:1:k %addieren in temp
                tempvalue = tempvalue + Spalte(i+x-1);
            end
            mittelwert(k-1+i,s) = tempvalue/k; %k-1+i Damit es erst bei k beginnt
        end
    end  
return
