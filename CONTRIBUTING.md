# Prispevki

Dobrodošli so prispevki v obliki popravkov in rešitev nalog.
Če želite prispevati,
odprite [issue](https://github.com/jaanos/or-zbirka/issues),
kjer opišete težavo (in morda predlagate, kako bi jo odpravili),
ali pa [pull request](https://github.com/jaanos/or-zbirka/pulls),
kjer sami prispevate vsebino in predlagate njeno vključitev v zbirko.

## Manjši popravki

Če bi radi opozorili na napako, lahko odprete issue,
lahko pa jo tudi sami poskusite popraviti.
Če gre za manjšo napako (npr. slovnična ali tipkarska napaka),
jo lahko popravite kar na GitHubu.
Na GitHubu poiščite datoteko, ki bi jo radi popravili,
in kliknite na ikono za urejanje desno zgoraj.
Če ga še nimate, se bo ustvaril fork (kopija) tega repozitorija,
v katerem sedaj urejate datoteko.
Ko spremenite želeno,
v spodnje okence napišete sporočilo ob commitu
ter s klikom na **Propose file change** pripravite pull request
iz nove veje na vašem forku (prvič bo ta poimenovana `patch-1`).
Tam lahko opišete, kaj ste popravili (ter zakaj predlagate popravek, itd.).
S klikom na **Create pull request** potem odprete pull request,
ki ga lahko potem sprejmem, ali pa zahtevam dodatne spremembe.

Ko je pull request odprt, lahko dodajate commite v vejo, s katere je odprt
(bodisi na GitHubu ali v lokalnem repozitoriju - glejte spodaj),
pa se bodo ti dodali tudi v pull request.
Ko je pull request sprejet,
lahko s klikom na **Delete branch** pobrišete vejo,
s katere ste ga odprli.

## Večji popravki

Za večje popravke (npr. dodajanje rešitev) bo bolje,
če si repozitorij klonirate k sebi
in tako delate popravke v lokalnih datotekah
(tako bo mogoče tudi prevajanje v PDF).
Najprej s klikom na **Fork** desno zgoraj naredite svojo kopijo repozitorija,
nato pa jo klonirajte k sebi, npr.
```bash
git clone https://github.com/jaanos/or-zbirka.git
```
Seveda tukaj zamenjajte `jaanos` s svojim uporabniškim imenom.

Svetujem, da vse popravke delate na svoji veji -
veja `master` naj ne vsebuje commitov, ki jih ni na glavnem repozitoriju.
Tako bo najbolje,
da si nastavite tudi prvotni repozitorij za potrebe sinhronizacije:
```bash
git remote add upstream https://github.com/jaanos/or-zbirka.git
```
Pred začetkom dela si sinhronizirajte vejo `master`.
```bash
git checkout master
git pull upstream master
```
Sedaj naredite novo vejo in začnite delati na njej.
```bash
git checkout -b resitev-naloge-1.8
```
Ime veje naj odraža vsebino sprememb v njej.
Pri delu se držite [smernic](STRUCTURE.md) za pisanje.
Ko so spremembe pripravljene (narejeni so ustrezni commiti),
lahko svojo vejo pošljete na GitHub:
```bash
git push origin resitev-naloge-1.8
```
Če za `git push` dodaste še parameter `-u`,
bo pri nadaljnjih pushih s te veje zadostovalo napisati `git push`.
Ko so commiti na GitHubu,
lahko odprete pull request
s svoje veje na vejo `master` na glavnem repozitoriju.

Zgornja navodila predpostavljajo, da uporabljate git iz ukazne vrstice -
seveda pa lahko uporabljate katerikoli odjemalec za git
(npr. TortoiseGit, GitHub Desktop, Sourcetree, ...).
