/*
    Recomenda uma ação baseando-se nas seguintes condições:
    - Estradas (boas / esburacadas)
    - Tempo (ensolarado / chuvoso)
*/

entra_estrada(E) :-
    nl,
    write('Como estao as estradas?'),
    nl,
    write('(boas, esburacadas) ===>'),
    read(E).

entra_tempo(T) :-
    nl,
    write('Como esta o tempo?'),
    nl,
    write('(ensolarado, chuvoso) ===>'),
    read(T).

recomenda_acao(C, ESTRADAS, TEMPO) :-
    ESTRADAS = boas, TEMPO = ensolarado -> C = 'va a praia';
    ESTRADAS = esburacadas, TEMPO = ensolarado -> C = 'va ao parque';
    ESTRADAS = boas, TEMPO = chuvoso -> C = 'va ao restaurante';
    ESTRADAS = esburacadas, TEMPO = chuvoso -> C = 'fique em casa'.

decisao :-
    entra_estrada(Pe),
    entra_tempo(Pt),
    recomenda_acao(Z, Pe, Pt),
    nl,
    write('voce deve ==>'),
    write(Z).

/*
    Consulta:
    ?- decisao
*/
