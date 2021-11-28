%%图形学大作业：回溯直线搜索
clear
clc
figure(1)
alpha=0.1;      %定义第一组值，固定β，观察图像随α的变化
beta=0.3;
x1=0;      %默认从（0，0）开始搜索
x2=0;
[figure10,calltime10]=back(alpha,beta,x1,x2);
calltime11=1:1:calltime10;
plot(calltime11,figure10,'b*-')
hold on
alpha1=0.2;     %第二组
beta1=0.3;
[figure20,calltime20]=back(alpha1,beta1,x1,x2);
calltime21=1:1:calltime20;
plot(calltime21,figure20,'ro-')
hold on
alpha2=0.4;      %第三组
beta2=0.3;
[figure30,calltime30]=back(alpha2,beta2,x1,x2);
calltime31=1:1:calltime30;
plot(calltime31,figure30,'gs-')
title('固定β，观察α值的变化对误差的影响');
legend('α=0.1','α=0.2','α=0.4');

figure(2)    %准备固定α，令β变化
alpha3=0.2;      %第一组
beta3=0.2;
[figure40,calltime40]=back(alpha3,beta3,x1,x2);
calltime41=1:1:calltime40;
plot(calltime41,figure40,'b*-')
hold on
alpha5=0.2;     %第二组
beta5=0.4;
[figure50,calltime50]=back(alpha5,beta5,x1,x2);
calltime51=1:1:calltime50;
plot(calltime51,figure50,'ro-')
hold on
alpha6=0.2;      %第三组
beta6=0.6;
[figure60,calltime60]=back(alpha6,beta6,x1,x2);
calltime61=1:1:calltime60;
plot(calltime61,figure60,'gs-')
title('固定α，观察β值的变化对误差的影响');
legend('β=0.2','β=0.4','β=0.6');

function [output,call]=back(alpha,beta,x1,x2)  %输出函数的值以及迭代次数
for call=1:300
   [gra1,gra2]=gra(x1,x2);
   tk=1;
   while f(x1-gra1*tk,x2-gra2*tk)>f(x1,x2)-alpha*tk*(gra1^2+gra2^2)   %步长
   tk=tk*beta;
   end
   yold=f(x1,x2);
   x1=x1-tk*gra1;
   x2=x2-tk*gra2;
   ynew=f(x1,x2);
   output(call)=yold-ynew;
      if gra1^2+gra2^2<=10^-6  %判定是否满足停止条件
       break;
   end
end
end
function [y]=f(x1,x2)  %函数的值
y=exp(x1+3*x2-0.1)+exp(x1-3*x2-0.1)+exp(-x1-0.1);
end
function [gradx1,gradx2]=gra(x1,x2)  %梯度
gradx1=exp(x1+3*x2-0.1)+exp(x1-3*x2-0.1)-exp(-x1-0.1);
gradx2=3*exp(x1+3*x2-0.1)-3*exp(x1-3*x2-0.1);
end