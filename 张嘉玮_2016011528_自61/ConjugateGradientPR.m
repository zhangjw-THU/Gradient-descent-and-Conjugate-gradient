function [X,Y,F,F_d] = ConjugateGradientPR(x0,y0)

    f = @(x,y)(1-x)^2+2*(y-x^2)^2;
    f_dx = @(x,y)-2*(1-x)-8*x*(y-x^2);
    f_dy = @(x,y)4*(y-x^2);

    eps = 10^(-10);
    n = 5;
    
    e = norm([abs(f_dx(x0,y0)),abs(f_dy(x0,y0))]);
    
    X = x0;
    Y = y0;
    F = f(x0,y0);
    F_d = e;
    
    syms a real
    count = 1;
    grad0 = [f_dx(x0,y0),f_dy(x0,y0)];
    D_old = [f_dx(x0,y0),f_dy(x0,y0)];
    while e>eps
        if mod(count-1,n)==0
            D = [f_dx(x0,y0),f_dy(x0,y0)];
        else
            
            aerph = (grad1(1)*(grad1(1)-grad0(1))+grad1(2)*(grad1(2)-grad0(2)))/(norm(grad0))^2;
            D = [-f_dx(x0,y0) + aerph*D_old(1) , f_dy(x0,y0) + aerph*D_old(2)];
        end
        count = count+1;
        D_old = D;
        f1 = f(x0 + a*D(1),y0 + a*D(2));
%         a0= goldenRatio(f1,-10,10,10^-10);
        a0 = goldenOpt(f1,-10,10,10^(-15));
        
        a0 = double(a0);
        grad0 = [f_dx(x0,y0),f_dy(x0,y0)];
        x0 = x0 + a0*D(1);
        y0 = y0 + a0*D(2);
        grad1 =[f_dx(x0,y0),f_dy(x0,y0)];
        X(:,count)=x0;
        Y(:,count)=y0;
        F(count) = f(x0,y0);
        f(x0,y0)
        e = norm([abs(f_dx(x0,y0)),abs(f_dy(x0,y0))]);
        F_d(count) = e;
        e
        
    end
end
            
        
        