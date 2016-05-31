function sol = txtl2( t,c,k )

%define variables initial conditions
D=c(1); Rp=c(2); DRp=c(3); 
m=c(4);  Xm=c(5); mXm=c(6); 
R=c(7); mR=c(8); p=c(9); Xp=c(10); pXp=c(11);

%define rateconstants
katx=k(1); kdtx=k(2); kcattx=k(3); % TX equation-ka forward, kd-reverse
kamdeg=k(4); kdmdeg=k(5); kcatmdeg=k(6);  %RNA degradation
katl=k(7); kdtl=k(8); kcattl=k(9); % Translation
kapdeg=k(10); kdpdeg=k(11); kcatpdeg=k(12); % protein degradation

% define ode - reaction equations
Ddot=-katx*D*Rp+kdtx*DRp+kcattx*DRp;
Rpdot=-katx*D*Rp+kdtx*DRp+kcattx*DRp;
%Rpdot=-Ddot;
DRpdot=-kdtx*DRp+katx*D*Rp-kcattx*DRp; % transcription

mdot=kcattx*DRp-kamdeg*m*Xm+kdmdeg*mXm-katl*m*R+kdtl*mR+kcattl*mR; % TX,degm,TL
Xmdot=-kamdeg*m*Xm+kdmdeg*mXm+kcatmdeg*mXm;
mXmdot=kamdeg*m*Xm-kdmdeg*mXm-kcatmdeg*mXm; % RNA degradation
%mXmdot=-Xmdot;

Rdot=-katl*m*R+kdtl*mR+kcattl*mR;
mRdot=katl*m*R-kdtl*mR-kcattl*mR;
%mRdot=-Rdot;
pdot=kcattl*mR-kapdeg*p*Xp+kdpdeg*pXp; % translation

Xpdot=-kapdeg*p*Xp+kdpdeg*pXp+kcatpdeg*pXp;
pXpdot=+kapdeg*p*Xp-kdpdeg*pXp-kcatpdeg*pXp; %protein degradation
%pXpdot=-Xpdot;

sol=[Ddot;Rpdot;DRpdot;mdot;Xmdot;mXmdot;Rdot;mRdot;pdot;Xpdot;pXpdot];




