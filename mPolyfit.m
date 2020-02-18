x = 1:50; 
y = -0.3*x + 2*randn(1,50); 
p = polyfit(x,y,1); 
f = polyval(p,x); 
plot(x,y,'o',x,f,'-') 
legend('data','linear fit') 
txt1 = ['y = (' num2str(p(1)) ')x+ (' num2str(p(2)) ')'];
text(x(25), y(25) + 1, txt1);
disp(p(1))
disp(p(2))