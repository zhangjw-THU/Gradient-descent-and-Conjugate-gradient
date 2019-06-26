close all
clear all
format long
f = @(x,y)(1-x)^2+2*(y-x^2)^2;
f_dx = @(x,y)-2*(1-x)-8*x*(y-x^2);
f_dy = @(x,y)4*(y-x^2);

%% �����½�����1����
% [X,Y,F,F_d]=steel_1norm(0,0);
% xlb = 1:1:length(F_d);
% figure(11)
% title('�ݶ�ֵ�½�����')
% plot(xlb,F_d)
% figure(13)
% title('����ֵ�½�����')
% plot(xlb,F)
% figure(12)
% x1=-0.5:0.01:1.5;y1=x1;
% [X1 Y1]=meshgrid(x1,y1);
% nn=length(x1);
% Z1=zeros(nn,nn);
% for i=1:nn
%     for j=1:nn
%         Z1(i,j)=f(X1(i,j),Y1(i,j));
%     end
% end
% hold on
% contour(X1,Y1,Z1)
% plot(X,Y,'o-','linewidth',1)
% 
% X_1norm = X;
% display('�����½�����1����')
% display('���Ž⣺')
% display('x1=')
% X(end)
% display('x2=')
% Y(end)
% display('����ֵ��')
% F(end)


%% �����½�����2����
% [X,Y,F,F_d]=steel_2norm(0,0);
% xlb = 1:1:length(F_d);
% figure(21)
% plot(xlb,F)
% figure(22)
% x1=-0.5:0.01:1.5;y1=x1;
% [X1 Y1]=meshgrid(x1,y1);
% nn=length(x1);
% Z1=zeros(nn,nn);
% for i=1:nn
%     for j=1:nn
%         Z1(i,j)=f(X1(i,j),Y1(i,j));
%     end
% end
% hold on
% contour(X1,Y1,Z1)
% plot(X,Y,'o-','linewidth',1)
% X_2norm = X;
% display('���Ž⣺')
% display('x1=')
% X(end)
% display('x2=')
% Y(end)
% display('����ֵ��')
% F(end)
% 



%%  �����½��������
% [X,Y,F,F_d]=steel_infnorm(0,0);
% xlb = 1:1:length(F_d);
% figure(31)
% plot(xlb,F)
% figure(33)
% plot(xlb,F_d)
% figure(32)
% x1=-0.5:0.01:1.5;y1=x1;
% [X1 Y1]=meshgrid(x1,y1);
% nn=length(x1);
% Z1=zeros(nn,nn);
% for i=1:nn
%     for j=1:nn
%         Z1(i,j)=f(X1(i,j),Y1(i,j));
%     end
% end
% hold on
% contour(X1,Y1,Z1)
% plot(X,Y,'o-','linewidth',1)
% X_infnorm = X;
% display('���Ž⣺')
% display('x1=')
% X(end)
% display('x2=')
% Y(end)
% display('����ֵ��')
% F(end)

%% �����ݶȷ���F-R����
% [X,Y,F,F_d] = ConjugateGradientFR(0,0);
% xlb = 1:1:length(F_d);
% figure(31)
% plot(xlb,F)
% figure(33)
% plot(xlb,F_d)
% figure(32)
% x1=-0.5:0.01:1.5;y1=x1;
% [X1 Y1]=meshgrid(x1,y1);
% nn=length(x1);
% Z1=zeros(nn,nn);
% for i=1:nn
%     for j=1:nn
%         Z1(i,j)=f(X1(i,j),Y1(i,j));
%     end
% end
% hold on
% contour(X1,Y1,Z1)
% plot(X,Y,'o-','linewidth',1)
% 
% display('���Ž⣺')
% display('x1=')
% X(end)
% display('x2=')
% Y(end)
% display('����ֵ��')
% F(end)

%% �����ݶȷ���P-R����
% [X,Y,F,F_d] = ConjugateGradientPR(0,0)
% xlb = 1:1:length(F_d);
% figure(31)
% plot(xlb,F)
% figure(33)
% plot(xlb,F_d,'LineWidth',2)
% figure(32)
% x1=-0.5:0.01:1.5;y1=x1;
% [X1 Y1]=meshgrid(x1,y1);
% nn=length(x1);
% Z1=zeros(nn,nn);
% for i=1:nn
%     for j=1:nn
%         Z1(i,j)=f(X1(i,j),Y1(i,j));
%     end
% end
% hold on
% contour(X1,Y1,Z1)
% plot(X,Y,'o-','linewidth',1)
% X_infnorm = X;



%% �����ݶȷ���B-S����
[X,Y,F,F_d] = ConjugateGradientBS(0,0);
xlb = 1:1:length(F_d);
figure(31)
plot(xlb,F)
figure(33)
plot(xlb,F_d)
figure(32)
x1=-0.5:0.01:1.5;y1=x1;
[X1 Y1]=meshgrid(x1,y1);
nn=length(x1);
Z1=zeros(nn,nn);
for i=1:nn
    for j=1:nn
        Z1(i,j)=f(X1(i,j),Y1(i,j));
    end
end
hold on
contour(X1,Y1,Z1)
plot(X,Y,'o-')