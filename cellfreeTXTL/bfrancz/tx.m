function sol = tx( t,D,p )
%p=[ktx,Nm,Rp,KTX,tau_0,tau_m,ktl,Np,KTL,R,tau_f];
ktx=p(1);Nm=p(2);Rp=p(3);KTX=p(4) %KTX is not determined
;tau_0=p(5);tau_m=p(6);
ktl=p(7);Np=p(8);KTL=p(9);R=p(10);tau_f=p(11);
Kp=p(12);
% protein degradation
Xp=p(13); % >10 in nM
kdeg=p(14);


% RNA equations
RpD=1/2*(Rp+D+KTX-sqrt((Rp+D+KTX).^2-4*Rp*D));
% Steady-state RNA
mss=tau_m*ktx*Nm^(-1)*RpD;
% RNA concentration - tx
m=mss'*(1-exp(-(t-tau_0)./tau_m));
% RNAP-RNA complex matrix
RpDmx=repmat(RpD',1,length(t));
% delay time
t2=t-tau_0;
mdeg=(mss'*(1-exp(t2-tau_0)./tau_m));

%RpD=1/2*(Rp+D+KTX-sqrt((Rp+D+KTX).^2-4*Rp*D)); % Rp, Dna complex concentrate
%mss=tau_m*ktx*Nm^(-1)*RpD; % steady state rna
% change in RNA
mdot=ktx*Nm^(-1)*RpDmx-1.*mdeg./tau_m;

%protein concentration


% Protein syn rate
%t3=t-tau_f;
psyndot=ktl*Np^(-1)*mss'*(1-exp(-(t-tau_0-tau_f)./tau_m))./(1+KTL/R);
pmaxdot=ktl*Np^(-1)*(1+KTL/R)^(-1)*mss';
eta=pmaxdot/(kdeg*Xp);
p=Kp*eta/(1-eta)+Xp*eta;

sol=[m(1);p(1)];


%function dydt = vdp1000(t,y)
%dydt = [y(2); 1000*(1-y(1)^2)*y(2)-y(1)];

% [t,y] = ode15s(@vdp1000,[0 3000],[2; 0]);
% plot(t,y(:,1),'-');
% title('Solution of van der Pol Equation, \mu = 1000');
% xlabel('time t');
% ylabel('solution y_1');