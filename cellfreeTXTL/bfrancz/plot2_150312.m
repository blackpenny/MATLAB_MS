D=30; % The DNA in nM
t=1:60; % time in min- 1 hour
Xp=1; % >10 in nM
kdeg=15/1; % per min
Kp=1; % >10 in nM

%RNA=tx(D,t);
Rp=30; %in nM
KTX=5; %range of 1-10 nM
tau_m=12;% in min
ktx=1; % rNTP s^1
Nm=714; % the CFP nucleotides
tau_0=15; % in min for the transcription

% steady-state for RNAP-DNA complex (initial value).
% RpD=1/2*(Rp+D+KTX-sqrt((Rp+D+KTX).^2-4*Rp*D)); % Rp, Dna complex concentrate
% mss=tau_m*ktx*Nm^(-1)*RpD; % steady state rna
% m=mss'*(1-exp(-(t-tau_0)./tau_m)); % the row is the dna, the column is the time
%figure;
%plot(t,m);
%hold on;


%figure;
%plot(t,m(1,:),'r',t,m(2,:),'b',t,m(3,:),'y',t,m(4,:),'m',t,m(5,:),'g',t,m(6,:),'k');

% protein synthesis
ktl=20; % bigger than 4
Np=238; %% aminoacid
KTL=10; % did not find -- change later
R=35; % bigger than 30- ribosome
tau_f=3; % maturation time between 1-5 min
p=[ktx,Nm,Rp,KTX,tau_0,tau_m,ktl,Np,KTL,R,tau_f];
% sol2=tx(1:60,30,p);

%sol=tx(t,D,p);
%plot(t,sol);
%figure;
[simT,simY] = ode23s(@(t,D)tx(t,D,p),t,[1,1]);

%figure;
simT;
simY;
figure;

plot(simT,simY(:,1),'r',simT,simY(:,2),'b'); % r RNA and b Protein
hold on;

%figure;
%psyn=ktl*Np^(-1)/(1+KTL/R)*mss'*(1-exp(-(t-tau_0-tau_f)./tau_m));
%plot (t, psyn);

%hold on;

% protein steady state
% kdegXp=0.01;
% km=50; % Km+Xm >100
% pmax=ktl*Np^(-1)/(1+KTL/R)*mss;
% eta=pmax/kdegXp;
% 
% protss=eta*(R*km);
% plot(t,protss);

% curve fit

% data=load('TXTL141219_cfp.mat');
% dataCfp2=data.TXTL141219_pRNAconc.c(1,:);
% dataCfp=dataCfp2{1,2};
% 
% ydata=dataCfp;
%cFit=lsqcurvefit(@tx,[1,30,5,714,30,5,15,12,20,238,10,35,3],dataCfp(:,1),dataCfp(:,2));

