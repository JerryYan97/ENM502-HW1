n = 20; % The dimension of our grid.

[A, b] = Diffusion(n);
% resT = A\transpose(b);
resT = Ludecomp(A, b, n * n, 0.001);
T = zeros(n);
for row = 1:n
    for col = 1:n
        idx = (row - 1) * n + col;
        T(row, col) = resT(idx);
    end
end

figure(5)
contourf(T)
colorbar
title(['Contour map for ', n,' by ', n,' grid'])

%struct2xml(x, 'myfile.xml')