
inserer(P,[],[P]).
inserer(P,[P1|X],[P,P1|X]) :- P=<P1. 
inserer(P,[P1|X],[P1|Y]) :- P>P1, inserer(P,X,Y).

tri_ins([X],[X]).
tri_ins([P|X],Y) :- tri_ins(X,Q), inserer(P, Q, Y). 

