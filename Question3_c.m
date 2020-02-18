% Performance Test for Matrix Caluculation in Q3
% n is dimension of a grid for our problem
n = 10:5:50;
t1 = zeros(length(n), 1);
t2 = zeros(length(n), 1);
for i = 1:length(n)
    [A, b] = Diffusion(n(i));
    % intrinstic time:
    temp = 0;
    for j = 1:5
        tic
        resT = A\transpose(b);
        temp = temp + toc;
    end
    t1(i) = temp / 5;
    
    % my method's time:
    temp = 0;
    for j = 1:5
        tic
        resT = Ludecomp(A, b, n(i) * n(i), 0.001);
        temp = temp + toc;
    end
    t2(i) = temp / 5;
end

% Get our plot:
% Get the matrix demension.
for i = 1:length(n)
    n(i) = n(i) * n(i);
end

n = log10(n);
t1 = transpose(log10(t1));
t2 = transpose(log10(t2));
sampleNum = length(n);
centerPos = floor(sampleNum / 2);

figure(1)
p1 = polyfit(n, t1, 1);
f1 = polyval(p1, n);
txt1 = ['y = (' num2str(p1(1)) ')x+ (' num2str(p1(2)) ')'];
plot(n, t1, '-o', n, f1, '-');
xlabel('log10( Matrix Size n )') %add an x label
ylabel('log10( Time in second )') % add a y label
title('intrinsic method')
legend('data','linear fit')
text(n( centerPos ), f1( centerPos ) - 0.08, txt1);

figure(2)
p2 = polyfit(n, t2, 1);
f2 = polyval(p2, n);
txt2 = ['y = (' num2str(p2(1)) ')x+ (' num2str(p2(2)) ')'];
plot(n, t2, '-o', n, f2, '-');
xlabel('log10( Matrix Size n )') %add an x label
ylabel('log10( Time in second )') % add a y label
title('my method')
legend('data','linear fit')
text(n( centerPos ), f2( centerPos ) - 0.08, txt2);




