%     ┌h2
% h1  │├───f5
% ├───┼f2
% f1  │├───h5
%     └h3 ┌f4
%      ├──┴h4
%      f3


pere(h1, h2).
pere(h1, f2).
pere(h1, h3).
pere(h3, h4).
pere(h3, f4).
pere(h2, f5).
pere(h3, h5).

mere(f1, h2).
mere(f1, f2).
mere(f1, h3).
mere(f3, h4).
mere(f3, f4).
mere(f2, f5).
mere(f2, h5).

homme(h1).
homme(h2).
homme(h3).
homme(h4).
homme(h5).

femme(f1).
femme(f2).
femme(f3).
femme(f4).
femme(f5).

parent(X,Y) :- pere(X,Y);mere(X,Y).

pdpere(X,Y) :- pere(X,Z),pere(Z,Y).
pdpere(X,Y) :- pere(X,Z),mere(Z,Y).

frere(X,Y) :- pere(Z,X),pere(Z,Y),mere(W,X),mere(W,Y),homme(Y),X\=Y.
soeur(X,Y) :- pere(Z,X),pere(Z,Y),mere(W,X),mere(W,Y),femme(Y),X\=Y.

demifrere(X,Y) :- pere(Z,X),pere(Z,Y),
                  mere(W1,X),mere(W2,Y),homme(Y),X\=Y,W1\=W2.
demifrere(X,Y) :- mere(Z,X),mere(Z,Y),
                  pere(W1,X),pere(W2,Y),homme(Y),X\=Y,W1\=W2.

demisoeur(X,Y) :- pere(Z,X),pere(Z,Y),
                  mere(W1,X),mere(W2,Y),femme(Y),X\=Y,W1\=W2.
demisoeur(X,Y) :- mere(Z,X),mere(Z,Y),
                  pere(W1,X),pere(W2,Y),femme(Y),X\=Y,W1\=W2.

ancetre(X,Y) :- parent(X,Y).
ancetre(X,Y) :- parent(X,Z), ancetre(Z,Y).


