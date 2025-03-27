go:-hypothesize(Disease),
write('Berdasarkan Gejala Burung
Puyuh sedang menderita penyakit:
'),
write(Disease), nl, undo.
/* hypotheses to be tested */
hypothesize(tatelo) :- tatelo, !.
hypothesize(radang_usus) :-
radang_usus, !.
hypothesize(berak_darah) :-
berak_darah, !.
hypothesize(berak_putih) :-
berak_putih, !.
hypothesize(snot) :-snot, !.
hypothesize(stress) :- stress, !.
hypothesize(kanibalisme) :-
kanibalisme, !.
hypothesize(unknown). /* no
diagnosis */
tatelo :-
tidak_aktif,bulu_rusak,nafsu_makan_menurun,gangguan_pernafasan,lumpuh,
verify(kepala_memutar_taktentu).
radang_usus :-
tidak_aktif,bulu_rusak,
verify(mata_tertutup),
verify(kotoran_berair).
berak_darah :-
bulu_rusak,sayap_lemah,
 verify(tinja_berdarah),
 verify(menggigil_kedinginan).
berak_putih :-
gangguan_pernafasan,sayap_lemah,
verify(kotoran_berwarna_putih),
verify(nafsu_makan_menghilang),
verify(bulu_mengerut).
snot :-gangguan_pernafasan,
 verify(infeksi_kelopak_mata),
 verify(leleran_area_lubang_pernafasan).
stress :- nafsu_makan_menurun,
 verify(gelisah),verify(kurus).
kanibalisme :-agresif,
verify(terdapat_burung_puyuh_mati_dengan_luka).
/* classification rules */ 
bulu_rusak :-
verify(ujung_bulu_bercabang),verify(bulu_kusam).
tidak_aktif :-
verify(berjalan_pelan),verify(paruh_puyuh_menjorok_kebawah).
sayap_lemah :-
verify(sayap_terkulai),!.
sayap_lemah :-
verify(terdapat_luka_di_sayap).
lumpuh :-
verify(kaki_bengkak),verify(tidak_mau_berjalan).
gangguan_pernafasan :-
verify(ngorok),verify(paruh_sering_terbuka).
nafsu_makan_menurun :-
verify(makanan_tidak_habis),verify(
tidak_mau_minum).
agresif:-
verify(mematuk_burung_puyuh_lain),!.
agresif:-
verify(mematuk_kepala_hinggaBotak).
/* how to ask questions */
ask(Question) :-
write('Apakah burung puyuh
memiliki gejala : '),
write(Question), write('? '),
read(Response), nl,
( (Response == yes ; Response == y)
-> assert(yes(Question)) ;
assert(no(Question)), fail).
:- dynamic yes/1,no/1.
/* How to verify something */
verify(S) :- (yes(S) -> true ; (no(S) ->
fail ; ask(S))).
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.