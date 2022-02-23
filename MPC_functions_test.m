clear 
close all


Hp = 3;
Hu = 2;
A = [2 -3 ; 4 -5];
B = [2; 3];
C = [1 0];
D = [0];

[A,B,C,D] = ssdata(c2d(ss(A,B,C,D),0.01))


%Q = [2 0 ; 0 1];
Q = 10;
R = 1;

numberOfStates = width(C);
numberOfInputs = height(B);
numberOfOutputs = height(C);


[refoData] = reformulation(A,B,C,D,Hp,Hu,Q,R);


x_0 = [0 ; 0];
u_0 = 0;
r = 1;
x = x_0;
u = u_0;

[x_next,u_next] = MPC_step(refoData, x_0, u_0,r);
x = [x  x_next];
%u = [u ; u_next];

for k = 1:1:1000
    x_prev = x_next;
    u_prev = u_next;
    [x_next,u_next] = MPC_step(refoData, x_prev, u_prev,r);
    x = [x  x_next];
    %u = [u  u_next];
end
y = C*x;
plot(x')
hold on
plot(y,'g')











