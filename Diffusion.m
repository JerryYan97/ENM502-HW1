function[A, b] = Diffusion(n)
% n is the number of an axis.
% init vector b:
A = eye(n * n);
h = 1 / (n - 1);
h2 = h * h;
h2Inv = 1 / h2;
for row = 1:n
    for col = 1:n
        idx = (row - 1) * n + col;
         if row == 1 || row == n || col == 1 || col == n
            b(idx) = 0;
        else
            b(idx) = -2;
            A(idx, idx) = -4 * h2Inv;
            A(idx, idx - 1) = 1 * h2Inv;
            A(idx, idx + 1) = 1 * h2Inv;
            A(idx, idx - n) = 1 * h2Inv;
            A(idx, idx + n) = 1 * h2Inv;
         end
    end
end
end