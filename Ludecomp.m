function[resX] = Ludecomp(a, b, n, tol)
o = 1:n;
s = 1:n;
er = 0;
resX = 1:n;
[a, er, o] = Decompose(a, n, tol, o, s);
if er ~= -1
    resX = Substitute(a, o, n, b);
end

end