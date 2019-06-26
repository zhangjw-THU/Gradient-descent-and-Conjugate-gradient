
function res = goldenRatio(func,a1,b1,L)
%初始化
a_k = a1; 
b_k = b1;
lambda_k = a1 + 0.382*(b1 - a1);
mu_k = a1 + 0.618*(b1 - a1);
% f1 = func(lambda_k);
f1 = subs(func,'a',lambda_k);
% f2 = func(mu_k);
f2 = subs(func,'a',mu_k);

count = 1;
while(true)
    %实际使用时可以去掉state和count，因为会影响运行速度
    %state(count,:) = [a_k b_k lambda_k mu_k f1 f2]; 
    count = count + 1;

    if(b_k - a_k < L) break;end
    if(f1 > f2)
        a_k = lambda_k;
        %b_k = b_k; 
        lambda_k = mu_k;
        mu_k = a_k + 0.5*(sqrt(5)-1)*(b_k - a_k);
        f1 = f2;
        f2 = subs(func,'a',mu_k);
    else
        %a_k = a_k;
        b_k = mu_k;
        mu_k = lambda_k;
        lambda_k = a_k + 0.5*(3-sqrt(5))*(b_k - a_k);
        f2 = f1;
        f1 = subs(func,'a',lambda_k);
    end
    
end
res = 0.5*(a_k + b_k);
end
