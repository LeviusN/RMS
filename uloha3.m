clear all, clc;

m=10;
g=9.81;
l=1;
r=l/2;
b=0.05;
omega=sqrt(g/l);
Kv=-1/g;
B=0.1;
a=3;
J=(2/5)*m*l*r*r*m*a^2;
konst=3;
K=1;
Tm=1;



%%

mr=0.1;
numgen=30; % number of generations
lpop=20; % number of stringls
Extended=1; % volba fit funkcie
%% Initalization

n = 20; % volba rand cisla od 1 do n
l = 3 ;% Dlyka retazca

h=3000;
Space=[ones(1,3)*(0);ones(1,3)*3000];
Space1=ones(1,3)*3000;
Pop=genrpop(n,Space);

fittrandALL = zeros(n,numgen);
allBest = zeros(numgen,l);
%% Algorithm
for gen=1:numgen

    for i=1:n
      G=Pop(i,:);
      Kp=G(1);
      Ki=G(2);
      Kd=G(3);
      sim('C:/Users/Niki/Documents/STU/RMS/Uloha3/uloha3simulink.slx');
      e=ans.e; 
    

      if Extended==1
          Fit(i)=sum(alfa*abs(e)+beta*abs(e2))+v*sum(alfa2*abs(ee)+beta2*abs(ee2));
      elseif Extended==0
          Fit(i)=sum(abs(e));
      end

    end
    
   fittrand(gen)=min(Fit);

   Best=selbest(Pop, Fit, [1,1]);
   Work=selrand(Pop, Fit,18);
   Work=crossov(Work,1,0);
   Work=mutx(Work,mr,Space);
   Work=muta(Work,mr,Space1,Space);

   Pop=[Best;Work];
   gen
   % allBest(gen,:)=Best(1,:);
end

G=Pop(1,:)
Kp=G(1);
Ki=G(2);
Kd=G(3);
