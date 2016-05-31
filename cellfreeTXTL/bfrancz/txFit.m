% function m = txFit( t,D,p )
% %p=[ktx,Nm,Rp,KTX,tau_0,tau_m,ktl,Np,KTL,R,tau_f];
% ktx=p(1);Nm=p(2);Rp=p(3);KTX=p(4);tau_0=p(5);tau_m=p(6);
% ktl=p(7);Np=p(8);KTL=p(9);R=p(10);tau_f=p(11);
% 
% 
% RpD=1/2*(Rp+D+KTX-sqrt((Rp+D+KTX).^2-4*Rp*D));
% mss=tau_m*ktx*Nm^(-1)*RpD;
% mTX=(mss'*(1-exp(-(t-tau_0*2)./tau_m)))./tau_m;
% RpDmx=repmat(RpD',1,length(t));
% 
% %prot syn
% %psyn=ktl*Np^(-1)/(1+KTL/R)*mss'*(1-exp(-(t-tau_0-tau_f)./tau_m));
% m=(-1).*mTX+ktx*Nm^(-1)*RpDmx;
% %sol=[m(1);psyn(1)];


%RpD=1/2*(p(3)+x(2)+p(4)-sqrt((p(3)+x(2)+p(4)).^2-4*p(3)*x(2)))
%mss=p(6)*p(1)*p(2)^(-1)*RpD;
%mTX=(mss'*(1-exp(-(x(1)-p(5)*2)./p(6))))./p(6);
%RpDmx=repmat(RpD',1,length(x(1)));
x=horzcat((1:60)',ones(60,1)*60); % D and t
Rp=30;
KTX=5; %range of 1-10 nM
tau_m=12;% in min
ktx=1; % rNTP s^1
Nm=714; % the CFP nucleotides
tau_0=15; % for the transcription
p=[ktx,Nm,Rp,KTX,tau_0,tau_m];

data=load('TXTL141219_cfp.mat'); % the data- datacfp(:,1)-xdata
dataCfp2=data.TXTL141219_pRNAconc.c(1,:);
dataCfp=dataCfp2{1,2};
[lb,ub]=quickbnd(p,100);
txfit=@(p,x)((p(6).*p(1).*p(2).^(-1).*(1/2.*(p(3)+x(1,2)+p(4)-sqrt((p(3)+x(1,2)+p(4)).^2-4.*p(3).*x(1,2)))))'.*(1-exp(-(x(:,1)-p(5).*2)./p(6))))./p(6);
cFit=lsqcurvefit(txfit,p,x,dataCfp(1:60,2),lb,ub);
figure;
plot (t,txfit(cFit,x),'r',t,dataCfp(1:60,2),'b');
hold on;
