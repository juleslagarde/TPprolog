% additionneur binaire 4 bits 

% addi(A,B,Cin,S,Cout)
%addi(0,0,0,0,0).
%addi(0,0,1,1,0).
%addi(0,1,0,1,0).
%addi(0,1,1,0,1).
%addi(1,0,0,1,0).
%addi(1,0,1,0,1).
%addi(1,1,0,0,1).
%addi(1,1,1,1,1).

et(0,0,0).
et(1,0,0).
et(0,1,0).
et(1,1,1).
ou(0,0,0).
ou(1,0,1).
ou(0,1,1).
ou(1,1,1).
ouex(0,0,0).
ouex(1,0,1).
ouex(0,1,1).
ouex(1,1,0).

addi(A,B,Cin,S,Cout) :- 
	ouex(A,B,Z1),et(A,B,Z2),et(Cin,Z1,Z3),ouex(Z1,Cin,S),ou(Z2,Z3,Cout).

addi4([A1,A2,A3,A4],[B1,B2,B3,B4],[C0,C1,C2,C3,C4]) :-
	addi(A4,B4,0,C4,R4),
	addi(A3,B3,R4,C3,R3),
	addi(A2,B2,R3,C2,R2),
	addi(A1,B1,R2,C1,C0).
