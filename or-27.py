class UtezenDigraf:
    "Prostorska zahtevnost: O(n^2)"

    def __init__(G):
        "Časovna zahtevnost: O(1)"
        G.A = {}
        
    def dodajVozlisce(G, u):
        "Časovna zahtevnost: O(n)"
        if u in G.A:
            return
        G.A[u] = {w: float('inf') for w in G.A}
        for w in G.A:
            G.A[w][u] = float('inf')

    def dodajPovezavo(G, u, v, r):
        "Časovna zahtevnost: O(1)"
        assert u in G.A and v in G.A
        G.A[u][v] = r

    def brisiPovezavo(G, u, v):
        "Časovna zahtevnost: O(1)"
        assert u in G.A and v in G.A
        del G.A[u][v] 

    def brisiVozlisce(G, u):
        "Časovna zahtevnost: O(n)"
        del G.A[u]
        for w in G.A:
            del G.A[w][u]

    def vozlisca(G, ):
        return G.A.keys()

    def izhodniSosedi(G, u):
        "Časovna zahtevnost: O(n)"
        return [w for w in G.A if G.A[u][w]]

    def utezeniSosedi(G,u):
        return G.A[u]    

    def vhodniSosedi(G, u):
        "Časovna zahtevnost: O(n)"
        return [w for w in G.A if G.A[w][u]]



    def FW_maksimalni_dobicek(G, zacetek):
        razdalja = {(u, v): 0 if u == v else float('inf') #naredimo slovar negativnih razdalij(dobickov)
                for u in G.vozlisca() for v in G.vozlisca()}
        pot = {(u, v): None for u in G.vozlisca() for v in G.vozlisca()} #naredimo slovar poti 
        for u in G.vozlisca():
            for v, r in G.utezeniSosedi(u).items():
                razdalja[u, v] = r
                pot[u,v] = [u,v]
        for w in G.vozlisca():
            for u in G.vozlisca():
                if razdalja[u, w] + razdalja[w, u] < 0: #zaznamo negativen(pozitiven) cikel
                    pot_zasluzka = pot[zacetek,u][:-1]+ pot[u,w][:-1] + pot[w,u][:-2]
                    return('inf', pot_zasluzka)
                for v in G.vozlisca():
                    r = razdalja[u, w] + razdalja[w, v]
                    if r < razdalja[u, v]:
                        razdalja[u, v] = r
                        pot[u,v] = pot[u,w] + pot[w,v][1:]   
        zasluzek = min(razdalja[zacetek,u] for u in G.vozlisca()) #v grafu ni cikla
        for u in G.vozlisca(): 
            if razdalja[zacetek,u] == zasluzek:
                konec = u
        pot_zasluzka = pot[zacetek,konec]
        zasluzek = -zasluzek #spremenimo predznak zasluzka 
        return (pot_zasluzka, zasluzek)

G = UtezenDigraf()
G.dodajVozlisce('a')
G.dodajVozlisce('b') 
G.dodajVozlisce('c') 
G.dodajVozlisce('d') 
G.dodajVozlisce('e') 
G.dodajVozlisce('f') 
G.dodajVozlisce('g') 
G.dodajVozlisce('h') 
G.dodajPovezavo('a','b',-3)
G.dodajPovezavo('a','f',-6)
G.dodajPovezavo('g','f',-1)
G.dodajPovezavo('f','g',-8)
G.dodajPovezavo('e','g',-1)
G.dodajPovezavo('h','g',-5)
G.dodajPovezavo('e','d',-1)
G.dodajPovezavo('e','d',-1)
G.dodajPovezavo('d','h',-4)
G.dodajPovezavo('d','b',-9)
G.dodajPovezavo('c','d',-7)
G.dodajPovezavo('e','d',-1)
G.dodajPovezavo('b','e',-9)
G.dodajPovezavo('b','c',-7)
G.dodajPovezavo('b','c',-7)
G.FW_maksimalni_dobicek('a')
    
    
H = UtezenDigraf()
H.dodajVozlisce('a')
H.dodajVozlisce('b')
H.dodajVozlisce('c')
H.dodajVozlisce('d')
H.dodajVozlisce('e')
H.dodajVozlisce('f')
H.dodajVozlisce('g')
H.dodajVozlisce('h')
H.dodajVozlisce('i')
H.dodajVozlisce('j')
H.dodajPovezavo('a','c',-3)
H.dodajPovezavo('c','d',-1)
H.dodajPovezavo('c','i',2)
H.dodajPovezavo('i','g',1)
H.dodajPovezavo('i','h',-6)
H.dodajPovezavo('g','h',-6)
H.dodajPovezavo('e','h',1)
H.dodajPovezavo('e','g',2)
H.dodajPovezavo('d','e',3)
H.dodajPovezavo('d','f',-6)
H.dodajPovezavo('b','e',-2)
H.dodajPovezavo('f','j',3)
H.dodajPovezavo('h','j',-1)
H.FW_maksimalni_dobicek('a')
H.FW_maksimalni_dobicek('b')
    