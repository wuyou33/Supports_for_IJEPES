%%%This is a program to generate electric vehicle data%%%%
%%%where AT means arrival time. PT means parking time. ED means energy demand(kW). pmax mean maximum charging power of EV%%%
%EV1
rng(1);%Fixed random number seed
EV1.AT=round(normrnd(19,sqrt(2),[750,1]));%N(19,2)
EV1.AT=max(EV1.AT,1);%Avoid subscripts out of range
EV1.AT=min(EV1.AT,24);%Avoid subscripts out of range
rng(1);
EV1.PT=round(normrnd(10,sqrt(2),[750,1]));%N(10,2)
EV1.PT=max(EV1.RT,4);
EV1.PT=min(EV1.PT,24);
rng(1);
EV1.ED=unifrnd(15,25,[750,1]);%U(15,20)
EV1.pmax=6.6*ones(750,1);
EV1.T=zeros(750,24);%T is the parking state matrix
for i=1:750
    if EV1.AT(i)+EV1.PT(i)-1>24
        EV1.T(i,EV1.AT(i):24)=1;
        EV1.T(i,1:EV1.AT(i)+EV1.PT(i)-25)=1;
    else
        EV1.T(i,EV1.AT(i):EV1.AT(i)+EV1.PT(i)-1)=1;
    end
end
%EV2
rng(2);
EV2.AT=round(normrnd(21,sqrt(2),[350,1]));
EV2.AT=max(EV2.AT,1);
EV2.AT=min(EV2.AT,24);
rng(2);
EV2.PT=round(normrnd(8,sqrt(2),[350,1]));
EV2.PT=max(EV2.PT,5);
EV2.PT=min(EV2.PT,24);
rng(2);
EV2.ED=unifrnd(35,50,[350,1]);
EV2.pmax=10*ones(350,1);
EV2.T=zeros(350,24);
for i=1:350
    if EV2.AT(i)+EV2.PT(i)-1>24
        EV2.T(i,EV2.AT(i):24)=1;
        EV2.T(i,1:EV2.AT(i)+EV2.PT(i)-25)=1;
    else
        EV2.T(i,EV2.AT(i):EV2.AT(i)+EV2.PT(i)-1)=1;
    end
end
%EV3
rng(3);
EV3.AT=round(normrnd(9,sqrt(2),[500,1]));
EV3.AT=max(EV3.AT,1);
EV3.AT=min(EV3.AT,24);
rng(3);
EV3.PT=round(normrnd(8,sqrt(2),[500,1]));
EV3.PT=max(EV3.PT,4);
EV3.PT=min(EV3.PT,24);
rng(3);
EV3.ED=unifrnd(15,25,[500,1]);
EV3.pmax=6.6*ones(500,1);
EV3.T=zeros(500,24);
for i=1:500
    if EV3.AT(i)+EV3.PT(i)-1>24
        EV3.T(i,EV3.AT(i):24)=1;
        EV3.T(i,1:EV3.AT(i)+EV3.PT(i)-25)=1;
    else
        EV3.T(i,EV3.AT(i):EV3.AT(i)+EV3.PT(i)-1)=1;
    end
end
%EV4
rng(4);
EV4.AT=round(normrnd(12,1,[200,1]));
EV4.AT=max(EV4.AT,1);
EV4.AT=min(EV4.AT,24);
rng(4);
EV4.PT=round(normrnd(2,1,[200,1]));
EV4.PT=max(EV4.PT,1);
EV4.PT=min(EV4.PT,24);
rng(4);
EV4.ED=unifrnd(20,25,[200,1]);
EV4.pmax=30*ones(200,1);
EV4.T=zeros(200,24);
for i=1:200
    if EV4.AT(i)+EV4.PT(i)-1>24
        EV4.T(i,EV4.AT(i):24)=1;
        EV4.T(i,1:EV4.AT(i)+EV4.PT(i)-25)=1;
    else
        EV4.T(i,EV4.AT(i):EV4.AT(i)+EV4.PT(i)-1)=1;
    end
end
%EV5
rng(5);
EV5.AT=round(normrnd(19,1,[200,1]));
EV5.AT=max(EV5.AT,1);
EV5.AT=min(EV5.AT,24);
rng(5);
EV5.PT=round(normrnd(2,1,[200,1]));
EV5.PT=max(EV5.PT,1);
EV5.PT=min(EV5.PT,24);
rng(5);
EV5.ED=unifrnd(20,25,[200,1]);
EV5.pmax=30*ones(200,1);
EV5.T=zeros(200,24);
for i=1:200
    if EV5.AT(i)+EV5.PT(i)-1>24
        EV5.T(i,EV5.AT(i):24)=1;
        EV5.T(i,1:EV5.AT(i)+EV5.PT(i)-25)=1;
    else
        EV5.T(i,EV5.AT(i):EV5.AT(i)+EV5.PT(i)-1)=1;
    end
end
%%%Distribution of electric vehicles to charging stations%%%
CS1.EV.T=[EV1.T(1:200,:);EV2.T(1:100,:)];
CS2.EV.T=EV3.T(1:250,:);
CS3.EV.T=[EV1.T(201:400,:);EV2.T(101:200,:)];
CS4.EV.T=[EV1.T(401:600,:);EV2.T(201:300,:)];
CS5.EV.T=[EV4.T(1:100,:);EV5.T(1:100,:)];
CS6.EV.T=EV3.T(251:500,:);
CS7.EV.T=[EV1.T(601:750,:);EV2.T(301:350,:)];
CS8.EV.T=[EV4.T(101:200,:);EV5.T(101:200,:)];
CS1.EV.pmax=[EV1.pmax(1:200);EV2.pmax(1:100)];
CS2.EV.pmax=EV3.pmax(1:250);
CS3.EV.pmax=[EV1.pmax(201:400);EV2.pmax(101:200)];
CS4.EV.pmax=[EV1.pmax(401:600);EV2.pmax(201:300)];
CS5.EV.pmax=[EV4.pmax(1:100);EV5.pmax(1:100)];
CS6.EV.pmax=EV3.pmax(251:500);
CS7.EV.pmax=[EV1.pmax(601:750);EV2.pmax(301:350)];
CS8.EV.pmax=[EV4.pmax(101:200);EV5.pmax(101:200)];
CS1.EV.ED=[EV1.ED(1:200);EV2.ED(1:100)];
CS2.EV.ED=EV3.ED(1:250);
CS3.EV.ED=[EV1.ED(201:400);EV2.ED(101:200)];
CS4.EV.ED=[EV1.ED(401:600);EV2.ED(201:300)];
CS5.EV.ED=[EV4.ED(1:100);EV5.ED(1:100)];
CS6.EV.ED=EV3.ED(251:500);
CS7.EV.ED=[EV1.ED(601:750);EV2.ED(301:350)];
CS8.EV.ED=[EV4.ED(101:200);EV5.ED(101:200)];
