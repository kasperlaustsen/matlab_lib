function [x_next,u_next] = MPC_step(refoData, x_prev, u_prev,r)
Tau = r*ones(refoData.Hp,1);

error = Tau - refoData.Psi * x_prev - refoData.Gamma * u_prev;

G = 2 * refoData.Theta' * refoData.Q * error;
H = refoData.Theta' * refoData.Q * refoData.Theta + refoData.R;


deltaU_opt_vector = 0.5 * H\G;
deltaU_opt = deltaU_opt_vector(1); 

x_next = refoData.A* x_prev + refoData.B * u_prev;
u_next = u_prev + deltaU_opt;
% x_next = refoData.A* x_prev + refoData.B * u_next;
end