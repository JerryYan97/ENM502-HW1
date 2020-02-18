% n: grid points number for an axis.
% This means h = 1/n;
% Theoretically, error should scalar with h.
% Reference should have n + n - 1 grid points along each axis.
function[errorNorm] = L2ErrorEvaWithA(n, a)
    ori_h = 1 / (n - 1);
    ref_h = 1 / (2 * n - 2);
    [oriA, orib] = DiffusionWithA(n, a);
    nPrime = 2 * n - 1;
    [refA, refb] = DiffusionWithA(nPrime, a);
    
    resTOri = Ludecomp(oriA, orib, n * n, 0.001);
    resTRef = Ludecomp(refA, refb, nPrime * nPrime, 0.001);
    
    TOri = zeros(n);
    for row = 1:n
        for col = 1:n
           idx = (row - 1) * n + col;
           TOri(row, col) = resTOri(idx);
         end
    end
    
    TRef = zeros(nPrime);
    for row = 1:nPrime
        for col = 1:nPrime
           idx = (row - 1) * nPrime + col;
           TRef(row, col) = resTRef(idx);
         end
    end
    
    errorNorm = 0;
    for col = 1:n
        for row = 1:n
            % Get space coordinate of (row, col) point for original grid.
            coordX = (col - 1) * ori_h;
            coordY = (row - 1) * ori_h;
            refCol = round((coordX / ref_h) + 1);
            refRow = round((coordY / ref_h) + 1);
            error = (TOri(row, col) - TRef(refRow, refCol)) * (TOri(row, col) - TRef(refRow, refCol));
            errorNorm = errorNorm + error;
        end
    end
    errorNorm = sqrt(errorNorm) / (n * n);    
end