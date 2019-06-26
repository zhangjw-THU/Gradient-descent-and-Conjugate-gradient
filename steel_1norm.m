function [X,Y,F,F_d] = steel_1norm(x0,y0)
    %OKÁË
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
    while (e>eps)%&&(n<100)
        e
        n = n+1;
        f_dvalue = [f_dx(x0,y0),f_dy(x0,y0)];
        f_dLfsz = norm([f_dx(x0,y0),f_dy(x0,y0)],inf);
        D=0;
        if abs(f_dvalue(1))==f_dLfsz
            D = [sign(-f_dx(x0,y0)),0];
        else
            if abs(f_dvalue(2))==f_dLfsz
                D = [0,sign(-f_dy(x0,y0))];
            end
        end
        f1 = f(x0 + a*D(1),y0 + a*D(2));
        a0=goldenOpt(f1,-10,10,10^(-12));
        a0 = double(a0);
        x0 = x0 + a0*D(1);
        y0 = y0 + a0*D(2);
        X(:,n)=x0;
        Y(:,n)=y0;
        F(n) = f(x0,y0);
        f(x0,y0)
        e = norm([abs(f_dx(x0,y0)),abs(f_dy(x0,y0))]);
        F_d(n) = e;
            
    end
end
 