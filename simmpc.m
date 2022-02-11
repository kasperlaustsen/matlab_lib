function [y1, u1] = simmpc(Ad, Bd, C, D, tend, r, Q, R, Hu, Hp, Lprime, wu, minfo)
% Ad, Bd, C, D is the discrete state space matrices.
% tend is the number of time units to be simulates.
% r is the reference signal (can be scalar or of dimensions (tend,1)
% Q is error punishment matrix
% R is reference punishment matrix
% Hu is input horizon
% Hp is prediction horizon of states
% wu is unmeasured disturbance signal
% minfo =[Ts, #states, #inputs, #measured disturbances, #unmeasured disturbances, #measured outputs, #unmeasured outputs]
if isempty(Lprime)
	pmod = ss2mod(Ad, Bd, C, D, minfo)
	imod = pmod
	Ks = smpccon(imod, Q, R, Hu, Hp)
	[y1, u1] = smpcsim(pmod, imod, Ks, tend, r, [], [], [], [], [], wu)
	plotall(y1,u1)
else
	pmod = ss2mod(Ad, Bd, C, D, minfo)
	imod = pmod
	Ks = smpccon(imod, Q, R, Hu, Hp)
	[y1, u1] =	smpcsim(pmod, imod, Ks, tend, r, [], Lprime,	[], [], [], wu)
% 				smpcsim(pmod, imod, Ks, tend, r, [], [],		[], [], [], wu)
	plotall(y1,u1)

end