function [ n ] = neighbor( s )

for i=1:2 
    x = randi(length(s));
    
    rnd_num = normrnd(0,sqrt(5));
    
    while ~(rnd_num >= 0 && rnd_num <= 10)
        rnd_num = normrnd(0,sqrt(5));
    end
    
    s(x) = rnd_num;
end

n = s;

end

