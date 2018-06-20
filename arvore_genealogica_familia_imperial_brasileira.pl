gerou(d_joao_vi, d_pedro_i).
gerou(d_carlota_joaquina, d_pedro_i).

gerou(d_pedro_i, d_maria_ii).
gerou(d_pedro_i, d_miguel).
gerou(d_pedro_i, d_joao_carlos).
gerou(d_pedro_i, d_januaria).
gerou(d_pedro_i, d_paula).
gerou(d_pedro_i, d_francisca).
gerou(d_pedro_i, d_maria_amelia).
gerou(d_pedro_i, d_pedro_ii).

gerou(d_leopoldina, d_maria_da_gloria).
gerou(d_leopoldina, d_miguel).
gerou(d_leopoldina, d_joao_carlos).
gerou(d_leopoldina, d_januaria).
gerou(d_leopoldina, d_paula).
gerou(d_leopoldina, d_francisca).
gerou(d_leopoldina, d_pedro_ii).

gerou(d_amelia, d_maria_amelia).

gerou(d_pedro_ii, d_afonso).
gerou(d_pedro_ii, d_isabel).
gerou(d_pedro_ii, princesa_leopoldina).
gerou(d_pedro_ii, d_pedro).

gerou(d_teresa, d_afonso).
gerou(d_teresa, d_isabel).
gerou(d_pedro_ii, princesa_leopoldina).
gerou(d_teresa, d_pedro).

gerou(gastao_d_orleans, d_pedro_de_orleans).
gerou(gastao_d_orleans, d_luis_de_orleans).
gerou(gastao_d_orleans, d_antonio_de_orleans).

gerou(d_isabel, d_pedro_de_orleans).
gerou(d_isabel, d_luis_de_orleans).
gerou(d_isabel, d_antonio_de_orleans).

gerou(d_pedro_de_orleans, d_isabel_i).
gerou(d_pedro_de_orleans, d_pedro_gastao).
gerou(d_pedro_de_orleans, d_francisca).
gerou(d_pedro_de_orleans, d_joao).
gerou(d_pedro_de_orleans, d_tereza).

gerou(elizabeth, d_isabel_i).
gerou(elizabeth, d_pedro_gastao).
gerou(elizabeth, d_francisca).
gerou(elizabeth, d_joao).
gerou(elizabeth, d_tereza).

gerou(d_luis_de_orleans, d_pedro_henrique).
gerou(d_luis_de_orleans, d_luis).
gerou(d_luis_de_orleans, d_pia_maria).

gerou(maria_pia, d_pedro_henrique).
gerou(maria_pia, d_luis).
gerou(maria_pia, d_pia_maria).

homem(d_afonso).
homem(d_antonio_de_orleans).
homem(d_joao).
homem(d_joao_carlos).
homem(d_joao_vi).
homem(d_luis).
homem(d_luis_de_orleans).
homem(d_miguel).
homem(d_pedro).
homem(d_pedro_de_orleans).
homem(d_pedro_gastao).
homem(d_pedro_henrique).
homem(d_pedro_i).
homem(d_pedro_ii).
homem(gastao_d_orleans).
mulher(d_amelia).
mulher(d_carlota_joaquina).
mulher(d_francisca).
mulher(d_isabel).
mulher(d_isabel_i).
mulher(d_januaria).
mulher(d_leopoldina).
mulher(d_maria_amelia).
mulher(d_maria_da_gloria).
mulher(d_maria_ii).
mulher(d_paula).
mulher(d_pia_maria).
mulher(d_tereza).
mulher(elizabeth).
mulher(maria_pia).
mulher(princesa_leopoldina).
mulher(d_teresa).

pai(PAI, FILHO) :- gerou(PAI, FILHO), homem(PAI).
mae(MAE, FILHO) :- gerou(MAE, FILHO), mulher(MAE).

avô(AVÔ, NETO) :- gerou(PAI, NETO), gerou(AVÔ, PAI), homem(AVÔ).
avó(AVÓ, NETO) :- gerou(PAI, NETO), gerou(AVÓ, PAI), mulher(AVÓ).

bisavô(BISAVÔ, BISNETO) :- gerou(BISAVÔ, AVÔ), gerou(AVÔ, PAI), gerou(PAI, BISNETO), homem(BISAVÔ).
bisavó(BISAVÓ, BISNETO) :- gerou(BISAVÓ, AVÔ), gerou(AVÔ, PAI), gerou(PAI, BISNETO), mulher(BISAVÓ).

filho(FILHO, PAI) :- (pai(PAI, FILHO); mae(PAI,FILHO)), homem(FILHO).
filha(FILHA, PAI) :- (pai(PAI, FILHA); mae(PAI,FILHA)), mulher(FILHA).

neto(NETO, AVO) :- (avô(AVO, NETO); avó(AVO,NETO)), homem(NETO).
neta(NETA, AVO) :- (avô(AVO, NETA); avó(AVO,NETA)), mulher(NETA).

bisneto(BISNETO, BISAVO) :- (bisavô(BISAVO, BISNETO); bisavó(BISAVO, BISNETO)), homem(BISNETO).
bisneta(BISNETA, BISAVO) :- (bisavô(BISAVO, BISNETA); bisavó(BISAVO, BISNETA)), mulher(BISNETA).

descendente(X,Y) :- mae(X,Y).
descendente(X,Y) :- pai(X,Y).
descendente(X,Y) :- mae(X,Z), descendente(Z,Y).
descendente(X,Y) :- pai(X,Z), descendente(Z,Y).
