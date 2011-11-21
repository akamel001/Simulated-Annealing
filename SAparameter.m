function [dCost] = SAparameter(sp)
%AP = 20

neighbors = [];
costs = [];
k = 0;


for i=0:20
    curNeighbor = neighbor(sp);
    curCost = cost(curNeighbor);

    costs = cat(1, costs, curCost);
    neighbors = cat(1, neighbors, curNeighbor);

end

neighbors(1,:) = [];
costs(1,:) = [];
sortedCosts = sortrows(cat(2, neighbors, costs), 3); %sorts it for best solution
BestSp = sortedCosts(1,1:2);

%to determin k
costs = [];
for i=1:20
    curNeighbor = neighbors(i,:);
    if(cost(curNeighbor) > cost(BestSp))
        k = k + 1;
    end
    costs = cat(1,costs, cost(curNeighbor) - cost(BestSp));
end
dCost = sum(costs)/k;
end