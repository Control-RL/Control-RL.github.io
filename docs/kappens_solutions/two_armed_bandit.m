h=100;
V=zeros(h+1,h+1,h+1,h+1); 	% V(n1+1,w1+1,n2+1,w2+1) is value V(n1,w1,n2,w2) n1,n2,w1,w2=0:h

for t=h-1:-1:0,
	%fprintf('t= %d:\n',t); 
	% n1+n2=t
	for n1=0:t,
		n2=t-n1;
		for w1=0:n1,
		for w2=0:n2,
			rho1=(w1+1)/(n1+2);
			rho2=(w2+1)/(n2+2);
			klad1=rho1+rho1*V(n1+2,w1+2,n2+1,w2+1)+(1-rho1)*V(n1+2,w1+1,n2+1,w2+1);
			klad2=rho2+rho2*V(n1+1,w1+1,n2+2,w2+2)+(1-rho2)*V(n1+1,w1+1,n2+2,w2+1);
			V(n1+1,w1+1,n2+1,w2+1)=max(klad1,klad2);
	%		fprintf('(%d%d%d%d)=%4.2f ',n1,w1,n2,w2,V(n1+1,w1+1,n2+1,w2+1));
		end;
		end;
	end;
	%fprintf('\n');
end;

% specify state n1,w1,n2,w2 
n1=1;w1=0;n2=0;w2=0;
% compute optimal arm to pull
rho1=(w1+1)/(n1+2);
rho2=(w2+1)/(n2+2);
klad1=rho1+rho1*V(n1+2,w1+2,n2+1,w2+1)+(1-rho1)*V(n1+2,w1+1,n2+1,w2+1);
klad2=rho2+rho2*V(n1+1,w1+1,n2+2,w2+2)+(1-rho2)*V(n1+1,w1+1,n2+2,w2+1);
if klad1>klad2,
	disp('pull arm 1');
else
	disp('pull arm 2');
end


