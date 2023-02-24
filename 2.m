a=0:0.2:2*pi
b=sin(a)
c=cos(a)
d=tan(a)



subplot(3,1,1);plot(a,b,'m','marker','^');title('plot 1')
legend('b')
grid on

subplot(3,1,2);plot(a,c,'k:o');title('plot 2')
legend('c')
grid on

subplot(3,1,3);plot(a,d,'c--*');title('plot 3')
legend('d')
grid on

