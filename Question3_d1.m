n = 3:20;
error = zeros(length(n), 1);
h = zeros(length(n), 1);
for i = 1:length(n)
    error(i) = L2ErrorEva(n(i));
    h(i) = 1 / (n(i) - 1);
end

sampleNum = length(h);

p2 = polyfit(h, error, 2);
f2 = polyval(p2, h);
txt2 = ['y = (' num2str(p2(1)) ')x^2+ (' num2str(p2(2)) ')x+ (' num2str(p2(3)) ')'];
plot(h, error, '-o', h, f2, '-');
text((h(sampleNum) + h(1)) / 4, (f2(sampleNum) + f2(1)) / 2,txt2);
legend('data','2nd degree fit')
title('Error Evluation a = 2')
xlabel('grid points distance h') %add an x label
ylabel('average error in norm2') % add a y label

