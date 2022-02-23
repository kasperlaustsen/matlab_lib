function [refoData] = reformulation(A,B,C,D,Hp,Hu,Q,R)
    

    A_refo = A;
    for i = 1:1:Hp-1
        A_refo = [A_refo ; A^(i+1)];
    end
    A_refo
    
    Bu = B;
    for i = 1:1:(Hp-1)
        nextEntry = 0;
        for j=0:1:i
            nextEntry = nextEntry + (A^j)*B;
        end
        Bu = [Bu; nextEntry];
    end
    Bu
    
    
    Bdu = toeplitz(Bu)
    Bdu = Bdu - triu(Bdu,1);        %% set upper triangle to zero
    
    Bdu = Bdu(:,1:Hu);              %% remove rows beyond Hu, as deltaU=0 there
    Bdu
    
    C_refo = C;
    for i=1:1:Hp-1
        C_refo = [C_refo zeros(height(C_refo),length(C)); zeros(height(C),length(C_refo)) C];
    end
    C_refo
    
    Q_refo = Q;
    for i=1:1:Hp-1
        Q_refo = [Q_refo zeros(height(Q_refo),length(Q)); zeros(height(Q),length(Q_refo)) Q];
    end
    Q_refo
    
    R_refo = R;
    for i=1:1:Hu-1
        R_refo = [R_refo zeros(height(R_refo),length(R)); zeros(height(R),length(R_refo)) R];
    end
    R_refo
    
    Psi = C_refo*A_refo;
    Gamma = C_refo*Bu;
    Theta = C_refo*Bdu;
    
    refoData.Psi = Psi;
    refoData.Gamma = Gamma;
    refoData.Theta = Theta;
    refoData.Q = Q_refo;
    refoData.R = R_refo;
    refoData.Hp = Hp;
    refoData.Hu = Hu;
    refoData.A = A;
    refoData.B = B;
    refoData.C = C;
    refoData.D = D;
    
end
    
    %[A_refo, B_refo, C_refo, D_refo] = ssdata(sys);
%end



