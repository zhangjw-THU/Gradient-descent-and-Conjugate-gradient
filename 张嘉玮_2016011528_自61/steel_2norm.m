function [X,Y,F,F_d] = steel_2norm(x0,y0)

    f = @(x,y)(1-x)^2+2*(y-x^2)^2;
    f_dx = @(x,y)-2*(1-x)-8*x*(y-x^2);
    f_dy = @(x,y)4*(y-x^2);

    eps = 10^(-10);

    e = norm([abs(f_dx(x0,y0)),abs(f_dy(x0,y0))]);
    X = x0;
    Y = y0;
    F = f(x0,y0);
    F_d = e;
    syms a real
    n=1;
    while e>eps
        n = n+1;
        D = [-f_dx(x0,y0),-f_dy(x0,y0)]
        f1 = f(x0+a*D(1),y0+a*D(2));
        
        a0 = goldenOpt(f1,-10,10,10^(-15));
        x0 = x0+a0*D(1);
        y0 = y0+a0*D(2);
        X(:,n)=x0;
        Y(:,n)=y0;
        F(n) = f(x0,y0);     
        e = norm([abs(f_dx(x0,y0)),abs(f_dy(x0,y0))]);
        F_d(n) = e;
        e
        f(x0,y0)
    end
end
 