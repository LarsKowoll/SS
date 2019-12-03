function [ausgangssignal] = U3delay(y, Daempfung, Samples)
    FileSize = size(y,1);
    
    %Samples * 2 für 0en hinten und vorne zum ausklingen und indexschutz
    ausgangssignal = zeros(FileSize+(Samples*2),0);
    
    for i=Samples:1:size(y)     
       ausgangssignal(i) = (Daempfung * y(i-Samples+1)) + y(i);
    end
    
    %ausklingen lassen
    for i=size(y):1:size(ausgangssignal)
        ausgangssignal(i) = (Daempfung * ausgangssignal(i-Samples+1)) + ausgangssignal(i);
    end
    
    %Transponieren von Zeilen- zu Spaltenvektor
    ausgangssignal = ausgangssignal';
    return
end