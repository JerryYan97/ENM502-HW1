function[a, erRes, o] = Decompose(a, n, tol, o, s)
for i = 1:n
    o(i) = i;
    s(i) = abs(a(i,1));
    for j = 2:n
        if abs(a(i,j)) > s(i)
            s(i)=abs(a(i,j));
        end
    end
end
for k = 1:n-1
    o = Pivot(a, o, s, n, k);
    if abs(a(o(k),k)/s(o(k))) < tol
        erRes = -1;
        disp("The tolerance number is:")
        disp(a(o(k),k)/s(o(k)))
        break
    end
    for i = k+1:n
        factor = a(o(i),k)/a(o(k),k);
        a(o(i),k) = factor;
        for j = k+1:n
            a(o(i),j) = a(o(i),j) - factor * a(o(k),j);
        end
    end
end
if abs(a(o(k),k)/s(o(k))) < tol
	erRes = -1;
    disp("The tolerance number is:")
	disp(a(o(k),k)/s(o(k)))
end
%aRes = a
%oRes = o
erRes = 1;
end