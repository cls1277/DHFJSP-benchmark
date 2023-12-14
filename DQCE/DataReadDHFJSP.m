function [N,F,TM,H,SH,NM,M,time,ProF]=DataReadDHFJSP(filepath)
%distributed flexible job shop scheduling problem
%the same operation processed in different factory has the same candidate
%machine selection
%the whole operations of a job must be processed on the same factory
    fin=fopen(filepath,'r'); %鎵撳紑txt鏂囦欢
    A=fscanf(fin,'%d');
    A=A';
    fclose(fin);
    N=A(1);
    F=A(2);
    TM=A(3);
    p=6;
    H=zeros(1,N);
    M={};time={};NM={};
    for f=1:F
        for j=1:N
            H(j)=A(p);         
            p=p+2;
            for o=1:H(j)
                NM{j,o}=A(p);                
                p=p+1;
                for k=1:NM{j,o}
                    M{j,o,k}=A(p);                
                    p=p+1;
                    time{f,j,o,M{j,o,k}}=A(p);                    
                    p=p+1;
                end
                p=p+1;
            end
            p=p+1;
        end
    end
    SH=sum(H);
    ProF=zeros(N,F);%每个工件在每个工厂上的平均加工时间总和
    for f=1:F  
        for i=1:N
            toTime=0;
            for j=1:H(i)
                averTime=0;
                for k=1:NM{i,j}
                    mc=M{i,j,k};
                    averTime=averTime+time{f,i,j,mc};
                end
                averTime=averTime/NM{i,j};
                toTime=toTime+averTime;
            end
            ProF(i,f)=toTime;
        end
    end
    for i=1:N
        tot=0;
        for f=1:F
            tot=tot+ProF(i,f);
        end
        for f=1:F
            ProF(i,f)=ProF(i,f)/tot;
        end
    end
    
end