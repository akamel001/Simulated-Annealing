function [solution, sbest] = SA(sinitial, Tinitial, alpha, beta, Minitial, maxiter)

T = Tinitial;
CurS = sinitial;
BestS = CurS;
CurCost = cost(CurS);
BestCost = CurCost;
Time = 0;
solution = [];
sbest = [];

M = Minitial;


while(Time < maxiter)
    [CurS, CurCost, BestS, BestCost] = metropolis(CurS, CurCost, BestS, BestCost, T, M);
    Time = Time + M;
    T = alpha * T;
    M = beta * M; 
    tmp = [Time, CurCost, BestCost];
    solution = cat(1, solution, tmp);
    sbest = cat(1, sbest, BestS);
end
end

function [RCurS, RCurCost, RBestS, RBestCost] = metropolis(CurS, CurCost, BestS, BestCost, T, M)
m1 = M;
while(m1 ~= 0)
    NewS = neighbor(CurS);
    NewCost = cost(NewS);
    avrgCost = NewCost - CurCost;
    if(avrgCost > 0)
        CurS = NewS;
        CurCost = NewCost;
        if(NewCost > BestCost)
            BestS = NewS;
            BestCost = NewCost;
        end
    else
        if(rand > exp((-avrgCost/T)))
            CurS = NewS;
            CurCost = NewCost;
        end
    end
    m1 = m1-1;
end
RCurS= CurS; RCurCost = CurCost; RBestS = BestS; RBestCost = BestCost;
end
