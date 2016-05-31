% Initial conditions
%D=c(1); Rp=c(2); DRp=c(3);m=c(4);  Xm=c(5); mXm=c(6); R=c(7); 
%mR=c(8); p=c(9); Xp=c(10); pXp=c(11);

%D-DNA, Rp-rnapolymerase; DRp=dna, pRNA complex;m-RNA; 
%Xm-rnase; mXm-RNA-rnase complex; R-ribosome; 
%mR-RNA, ribosome complex; p-protein; Xp-protease; pXp-protease-prot complex;

% in nM
D=60; Rp=10; Xm=20; R=20; Xp=10;
DRp=0;m=0; mXm=0; mR=0; p=0; pXp=0;
%DRp=1;m=1; mXm=1; mR=1; p=1; pXp=1;

c=[D,Rp,DRp,m,Xm,mXm,R,mR,p,Xp,pXp];

% rate constants
%katx=k(1); kdtx=k(2); kcattx=k(3); % TX equation-ka forward, kd-reverse
%kamdeg=k(4); kdmdeg=k(5); kcatmdeg=k(6);  %RNA degradation
%katl=k(7); kdtl=k(8); kcattl=k(9); % Translation
%kapdeg=k(10); kdpdeg=k(11); kcatpdeg=k(12); % protein degradation
%g=[1,3,6];

%k=[10,1,5,2,4,2,10,1,5,2,4,2];
%k2=[0.5,3100,50,200,180,50,12,5,10,0.5,0.4,0.2];

k3=[1,0.02,0.1,0.08,0.08,0.01,0.01,0.1,0.02,0.01,0.2,0.02];
t=1:60; % time in min- 1 hour
%s=txtl2(t,c,k);

[simT,simY] = ode23s(@(t,c)txtl2(t,c,k3),t,c);



figure;
plot(simT,simY(:,1),'r',simT,simY(:,2),'b',simT,simY(:,3),'k',...
 simT,simY(:,4),'m',simT,simY(:,5),'c',simT,simY(:,6),'-.',...
    simT,simY(:,7),'g',simT,simY(:,8),'o',simT,simY(:,9),'-',...
    simT,simY(:,10),'.-',simT,simY(:,11),'--'); % r RNA and b Protein


legend('D', 'Rp', 'DRp','m', 'Xm', 'mXm', 'R','mR', 'p', 'Xp', 'pXp');
%mR=c(8); p=c(9); Xp=c(10); pXp=c(11);
hold on;



