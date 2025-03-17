clear all
nu=0.5;
R=1;
ti=0;   % initial time
tf=2;   % horizon time
n=100; % number of time discretization steps
dt=(tf-ti)/(n-1);
dt=(tf-ti)/n;
N=10; % number of trajectories
u_all=zeros(N,n);
x_all=zeros(N,n);
x=zeros(N,1);
for i=1:n,
	t=ti+(i-1)*dt;
	T=tf-t;
	u=1/T*(tanh(x/nu/T)-x);
	x=x+u*dt+sqrt(nu*dt)*randn(N,1);
	u_all(:,i)=u;
	x_all(:,i)=x;
end;
subplot(2,2,1)
plot(dt*(1:n),x_all')
axis([ti tf -2 2])
subplot(2,2,2)
plot(dt*(1:n),u_all')
%axis([ti tf -2 2])
