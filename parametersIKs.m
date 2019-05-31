%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                               %
%   Subunit interaction determines IKs participation in         %
%   cardiac repolarization and repolarization reserve           %
%   Silva and Rudy                                              %
%   Circulation 112: 1384-1391, 2005                            %
%                                                               %
%   Parameters for guinea pig_ventricular_IKs simulator         %
%                                                               %
%   September 5, 2007                                           %
%   Implemented by Stefano Severi                               %
%   Typos:                                                      %
%   - EKs(online data supplement):                              %
%     (R*T/F)*(log((Ko+pNaK*Nai)/(Ki+pNaK*Nai)))                %
%     ==> (R*T/F)*(log((Ko+pNaK*Nao)/(Ki+pNaK*Nai)))            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pr=3;                       % to select the voltage-clamp protocol in the simulator
sim_time=10.5;              %durata della simulazione da 1.
Vcost=1000;
load parottimiCTRL %E %CTR
% load parottimiISO   % uncomment to simulate ISO effects on IKs

x=10e-3



%% Constants
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
R=8.314;      % [J/mol/K] Gas constant (8.314472)
F=96485;      % [C/mol]	  Faraday constant (96485.3415)
T=310.0;      % [K]       Temperature 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Markov model
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
teta=1.96;   % [1/s] Transition rate between C15 and O1 states
%   Initial conditions (steady state at -80 mV)
C1o=0.0015;       % [] 
C2o=0.0244;       % [] 
C3o=0.1494;       % [] 
C4o=0.4071;       % [] 
C5o=0.4161;       % [] 
C7o=0.0001;       % [] 
C8o=0.0006;       % [] 
C9o=0.0008;       % [] 
C10o=0;           % [] 
C11o=0;           % [] 
C12o=0;           % [] 
C13o=0;           % [] 
C14o=0;           % [] 
C15o=0;           % [] 
O1o=0;            % [] 
O2o=0;            % [] 
C6o=1-(C1o+C2o+C3o+C4o+C5o+C7o+C8o+C9o+C10o+C11o+C12o+C13o+C14o+C15o+O1o+O2o);       % [] 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% EKs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Ko=5.4;         % [mM] extracellular K concentration
Nao=136;        % [mM] extracellular Na concentration
pNaK=0.01833;   % [ ] from Faber et al. Biophys. J. 2007
Ki=141.2;       % [mM] from Faber 2000
Nai=10;         % [mM] initial condition in Faber 2000
Caio=1e-4;
EKs=-.0724;     % [V] dal paper Rocchetti-Zaza 2006
GKsmax=12e-9;    % S