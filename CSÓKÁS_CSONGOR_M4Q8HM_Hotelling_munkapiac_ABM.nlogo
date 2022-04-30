breed [companies company]
breed [workers worker]

companies-own [

  profit ;                Profit
  wageM ;                 Férfi bér
  wageF ;                 Női bér
  area-countM ;           Férfi alkalmazottak száma
  area-countF ;           Női alkalmazottak száma
  eff ;                   Hatékonysági besorolás

  ;; Technikai változók ;;

  price ;                 A vállalat érzékelt piaci ára
  wageF-vector ;          Megelőző időszakok női béreinek vektora
  wageM-vector ;          Megelőző időszakok férfi béreinek vektora
  ra-wageF ;              Megelőző időszakok női béreinek mozgóátlaga
  ra-wageM ;              Megelőző időszakok férfi béreinek mozgóátlaga
  position-vector ;       Megelőző időszakok elhelyezkedéseinek vektora
  didtance-over-time ;    Megelőző időszakok elhelyezkedéseinek távolsága a mostani pozíciótól
  ra-profit ;             Megelőző időszakok profitjainak mozgóátlaga
  profit-vector ;         Megelőző időszakok profitjainak vektora
  area-countM-vector ;    Megelőző időszakok férfi alkalmazott számának vektora
  area-countF-vector ;    Megelőző időszakok női alkalmazott számának vektora
  closest-mean ;          Megelőző időszakok legközelebbi vállalat-távolságának mozgóátlaga
  closest-vector ;        Megelőző időszakok legközelebbi vállalat-távolságának vektora
  farthest-mean ;         Megelőző időszakok legtávolabbi vállalat-távolságának mozgóátlaga
  farthest-vector ;       Megelőző időszakok legtávolabbi vállalat-távolságának vektora
  ra-area-countF ;        Megelőző időszakok női alkalmazott számának mozgóátlaga
  ra-area-countM ;        Megelőző időszakok férfi alkalmazott számának mozgóátlaga
  wage-ratioMF-vector ;   Megelőző időszakok bérarányának vektora
  ra-wage-ratioMF ;       Megelőző időszakok bérarányának mozgóátlaga
  worker-ratioMF-vector ; Megelőző időszakok munkavállalói arányának vektora
  ra-worker-ratioMF ;     Megelőző időszakok munkavállalói arányának mozgóátlaga
  d-wM ;                  Férfi bér-mozgóátlagtól vett százalékos eltérés
  d-wF ;                  Női bér-mozgóátlagtól vett százalékos eltérés
  fix-cost ;              Egyéni kvázi-fix költség: a "fix-cost-of-prod" változó határozza meg (rögzítve 0)
  counter ;               Veszteségesség számláló
  num-of-employees ;      Alkalmazottak száma
  wage-ratioMF ;          Férfi és női bérek aránya
  wage-gapMF ;            A férfi és női bérek különbsége (előjeles)
  employee-ratioF ;       Női alkalmazottak aránya
  employee-ratioM ;       Férfi alkalmazottak aránya
  comp-dist-vek ;         A többi vállalattól vett összes távolság vektora
  mid-dist ;              A vállalat távolsága a középponttól
  last-pos ;              Előző időszaki pozíció
  last-dist ;             Előző időszak óta megtett távolság
  tot-dist ;              Teljes megtett távolság
  num-of-reloc ;          Helyváltoztatások száma
  mean-comp-wage ;        Vállalat átlagos bére
  profit-change ;         Profit változása előző időszakhoz képest
  wageM-change ;          Férfi bér változása előző időszakhoz képest
  wageF-change ;          Női bér változása előző időszakhoz képest
  mean-comp-wage-change ; Átlagbér változása előző időszakhoz képest
]

workers-own [

  reservation ;           Egyéni rezervációs hasznosság (a "Reservation-wage" fő változó állítja be)
  gender ;                Nem: 0 = férfi 1 = nő
  tcost ;                 Egyéni utazási költség együttható (Megegyezik a megfelelő csoportnak beállított együtthatóval)
  realised-income ;       Érzékelt bér
  preferred-company ;     Választott vállalat

  ;; Technikai változók ;;

  competetive-income ;    Második legjobb vállalatnál elérhető érzékelt bér
  alt-comp ;              Második legjobb vállalat
]

patches-own [

  ;; Technikai változók ;;

  dens ;                  Adott ponton tartózkodó munkavállalók száma (mindegyik csoportból)
  sum-income-here ;       Adott ponton tartózkodó munkavállalók érzékelt bérének összege
  patch-comp-dist ;       Adott ponthoz legközelebbi vállalat távolsága
]

globals [
  ;; Grafikus felület változói: ;;

  ;; Distance-calculation:               Utazási költség számításának módja
  ;; Market-shape:                       Piac alakja
  ;; Rules:                              Döntési szabályok
  ;; Starting-locations:                 Vállalatok kezdeti elhelyezkedése
  ;; Distribution:                       Munkavállalók eloszlása

  ;; Number-of-companies:                Kezdeti vállalatok száma
  ;; Travel-cost-F:                      Utazási költség együttható (Női)
  ;; Travel-cost-M:                      Utazási költség együttható (Férfi)
  ;; Base-market-price:                  Termék alapára
  ;; Reservation-wage:                   Rezervációs hasznosság nagysága
  ;; Starting-wageF:                     Kezdőbérek (Női)
  ;; Starting-wageM:                     Kezdőbérek (Férfi)
  ;; Efficiency-factor:                  Hatékonysági együttható
  ;; Number-of-efficient-companies:      Hatékony vállalatok száma

  ;; Two-groups:                         Két heterogén munkavállalói csoport
  ;; Worker-reservation:                 Rezervációs hasznosság
  ;; Discrimination:                     Diszkrimináció lehetősége
  ;; Efficiency                          Hatékonyság
  ;; Worker-perturbation                 Munkavállalók eloszlásának perturbálása
  ;; First/last-eff                      Hatékony vállalatok sorrendje

  ;; Megfigyelési változók ;;

  market ;                Piac pontjai
  new-companies ;         Új vállalatok (rögzítve hamis)
  fix-cost-of-prod ;      Termelés kvázi-fix költsége (rögzítve 0)
  cost-of-relocation ;    Elmozdulás fix költsége (rögzítve 0)
  unemployed ;            Munkanélküliek
  tot-employment ;        Foglalkoztatottak száma
  tot-employmentF ;       Foglalkoztatottak száma az F csoportból
  tot-employmentM ;       Foglalkoztatottak száma az M csoportból
  mean-employment ;       Átlagos foglalkoztatási szám
  employment-rate ;       Foglalkoztatási arány
  employment-rateF ;      Női foglalkoztatási aránya
  employment-rateM ;      Férfi foglalkoztatási aránya
  employment-ratioMF ;    Férfi/női foglalkoztatottak aránya
  mean-wageF ;            Átlagos női bér
  mean-wageM ;            Átlagos férfi bér
  mean-wage ;             Átlagos bér
  mean-profit ;           Átlagos profit
  max-profit ;            Maximális profit
  min-profit ;            Minimális profit
  max-wageF ;             Maximális nőknek ajánlott bér
  max-wageM ;             Maximális férfiaknak ajánlott bér
  min-wageF ;             Minimális nőknek ajánlott bér
  min-wageM  ;            Minimális férfiaknak ajánlott bér
  companies-died ;        Kilépett vállalatok száma (rögzítve 0)
  companies-new ;         Újonnan belépett vállalatok száma (rögzítve 0)
  company-number;         Vállalatok száma (rögzítve a kezdeti vállalatszámban)
]

;;;;;;;;;;;;;;;;;;;;;;;
;;;;Setup procedure;;;;
;;;;;;;;;;;;;;;;;;;;;;;

to setup

  clear-all

  setup-market
  setup-workers
  setup-companies
  recalculate-areas
  recalculate-profit
  recalculate-market-state

  reset-ticks

end

to setup-market

  ifelse Market-shape = "Line" [
    set market patches with [ pycor = 0 ]] [
    ifelse Market-shape = "Circle" [
      set market patches with [ ((pxcor) ^ 2) + ((pycor) ^ 2) <= ((max-pxcor) ^ 2) ]] [
      set market patches ]]

end

to setup-workers ;;Egyenletes eloszlással vannak a munkások

  ask market [ set dens 1 ]
  if Distribution = "half-half" [
    ask market with [pxcor <= 0] [set dens 2]]
  if Distribution = "dense-circle" [
    ask market with [distancexy 0 0 <= ((1 / 2) * max-pxcor)] [set dens 2]]
  if Distribution = "dense-square" [
    ask market with [pxcor <= (ceiling ((1 / 2) * max-pxcor)) and pxcor >= floor ((1 / 2) * min-pxcor) and pycor <= ceiling ((1 / 2) * max-pycor) and pycor >= floor ((1 / 2) * min-pycor)] [set dens 4]]

  ifelse worker-perturbation [
    random-seed 100
    ask market [
      sprout-workers (dens * 2) [
        ifelse Market-shape = "Line" [
          ifelse random-float 1 < 0.5 [
            facexy (min-pxcor - 1) 0 ] [
            facexy (max-pxcor + 1) 0 ]
          fd (random-float 1 - 0.5) ] [
          fd (random-float 0.5) ]
        set color black
        set shape "dot"
        set size 1.3
        set gender 0
        ifelse not worker-reservation [
          set reservation 0 ][
          set reservation reservation-wage]
        set tcost travel-cost-M
      ]
    ]
    if two-groups[
      ask market [
        sprout-workers (dens * 2) [
          ifelse Market-shape = "Line" [
            ifelse random-float 1 < 0.5 [
              facexy min-pxcor 0 ] [
              facexy max-pxcor 0 ]
            fd (random-float 0.4 - 0.2) ] [
            fd (random-float 1 - 0.5) ]
          set color black
          set shape "dot"
          set size 0.9
          set gender 1
          ifelse not worker-reservation [
            set reservation 0 ][
            set reservation reservation-wage]
          set tcost travel-cost-F
        ]
    ]]
    random-seed new-seed ] [
    ask market [
      sprout-workers dens [
        set color black
        set shape "dot"
        set size 1.5
        set gender 0
        ifelse not worker-reservation [
          set reservation 0 ][
          set reservation reservation-wage]
        set tcost travel-cost-M
      ]
    ]
    if two-groups[
      ask market [
        sprout-workers dens [
          set color black
          set shape "dot"
          set size 0.9
          set gender 1
          ifelse not worker-reservation [
            set reservation 0 ][
            set reservation reservation-wage]
          set tcost travel-cost-F
        ]
  ]]]


end

to setup-companies

  ifelse Market-shape = "Line" [
    ifelse Starting-locations = "Middle" [
      let i 1
      while [i < number-of-companies + 1] [
        ask patch (i - round (number-of-companies / 2)) 0 [create-company 1]
        set i (i + 1)]
    ] [
      ifelse Starting-locations = "Edges-1D" [
        let i 0
        while [i < number-of-companies] [
          ask item i (list patch 20 0 patch -20 0 patch 19 0 patch -19 0 patch 18 0 patch -18 0 patch 17 0) [create-company 1]
          set i (i + 1) ]
      ] [
        ifelse Starting-locations = "Equilibrium-no-pricing-1D" [
          ifelse number-of-companies = 1 [
            ask patch 0 0 [create-company 1]
          ] [
            ifelse number-of-companies = 2 [
              ask patches at-points [[0 0] [1 0]] [create-company 1]
            ] [
              ifelse number-of-companies = 4 [
                ask patches at-points [[-10 0] [-9 0] [9 0] [10 0]] [create-company 1]
              ] [
                ifelse number-of-companies = 5 [
                  ask patches at-points [[-14 0] [-13 0] [0 0] [13 0] [14 0]] [create-company 1]
                ] [
                  ifelse number-of-companies = 6 [
                    ask patches at-points [[-15 0] [-14 0] [-5 0] [5 0] [14 0] [15 0]] [create-company 1]
                  ] [
                    ifelse number-of-companies = 7 [
                      ask patches at-points [[-15 0] [-14 0] [-5 0] [4 0] [5 0] [14 0] [15 0]] [create-company 1]
                    ] [
                      ask n-of number-of-companies market [create-company 1] ;; Random (for other numbers)
        ]]]]]]] [
          ifelse Starting-locations = "Socially-optimal-1D" [
            ifelse number-of-companies = 1 [
              ask patch 0 0 [create-company 1]
            ] [
              ifelse number-of-companies = 2 [
                ask patches at-points [[-10 0] [10 0]] [create-company 1]
              ] [
                ifelse number-of-companies = 4 [
                  ask patches at-points [[-15 0] [-5 0] [5 0] [15 0]] [create-company 1]
                ] [
                  ifelse number-of-companies = 5 [
                    ask patches at-points [[-16 0] [-8 0] [0 0] [8 0] [16 0]] [create-company 1]
                  ] [
                    ifelse number-of-companies = 6 [
                      ask patches at-points [[-17 0] [-10 0] [-3 0] [3 0] [10 0] [17 0]] [create-company 1]
                    ] [
                      ifelse number-of-companies = 7 [
                        ask patches at-points [[-17 0] [-11 0] [-6 0] [0 0] [6 0] [11 0] [17 0]] [create-company 1]
                      ] [
                        ask patches at-points [[-13 0] [0 0] [13 0]] [create-company 1] ;; Random (for other numbers)
          ]]]]]]] [
            discrimination-test-locations
  ]]]]]
  [
    ifelse Market-shape = "Square" [
      ifelse Starting-locations = "Middle" [
        ask patch 0 0 [create-company 1]
        if number-of-companies - 1 > 0 [
          ask up-to-n-of (number-of-companies - 1) [neighbors4] of patch 0 0 [create-company 1]
          if number-of-companies - 5 > 0 [
            ask n-of (number-of-companies - 5) patches at-points [[-1 1] [-1 -1] [1 1] [1 -1]] [create-company 1]
      ]]] [
        ifelse Starting-locations = "Circle-max-2D" [
          create-ordered-companies number-of-companies [
            fd max-pxcor
            set shape "house"
            set size 2
            set pen-size 1
            set price base-market-price
            set wageM starting-wageM
            ifelse two-groups [
              ifelse discrimination [
                set wageF starting-wageF ][
                set wageF starting-wageM]][
              set wageF 0]
            ifelse two-groups [
              set wage-gapMF (wageM - wageF)
              ifelse wageF != 0 [
                set wage-ratioMF wageM / wageF][
                set wage-ratioMF "INF"]] [
              set wage-gapMF "NA"
              set wage-ratioMF "NA"]
            set fix-cost fix-cost-of-prod
            set counter 0
            set tot-dist 0
            set num-of-reloc 0
            set last-pos patch-here
            set profit 0
            set position-vector (list patch-here)
            set wageF-vector (list wageF)
            set wageM-vector (list wageM)
            set profit-vector (list)
            set area-countM-vector (list)
            set area-countF-vector (list)
            set wage-ratioMF-vector (list)
            set worker-ratioMF-vector (list)
            set farthest-vector (list)
            set closest-vector (list)
            set wageM-change 0
            set wageF-change 0
            set mean-comp-wage 0
            set eff 0
        ]] [
          ifelse Starting-locations = "Circle-2D" [
            create-ordered-companies number-of-companies [
              fd (((1 / 2) * (sqrt (1 + (sin(((pi / 2) - (2 * pi / number-of-companies)) * (180 / pi)) / 2)))) * max-pxcor)
              set shape "house"
              set size 2
              set pen-size 1
              set price base-market-price
              set wageM starting-wageM
              ifelse two-groups [
                ifelse discrimination [
                  set wageF starting-wageF ][
                  set wageF starting-wageM]][
                set wageF 0]
              ifelse two-groups [
                set wage-gapMF (wageM - wageF)
                ifelse wageF != 0 [
                  set wage-ratioMF wageM / wageF][
                  set wage-ratioMF "INF"]] [
                set wage-gapMF "NA"
                set wage-ratioMF "NA"]
              set fix-cost fix-cost-of-prod
              set counter 0
              set tot-dist 0
              set num-of-reloc 0
              set last-pos patch-here
              set profit 0
              set position-vector (list patch-here)
              set wageF-vector (list wageF)
              set wageM-vector (list wageM)
              set profit-vector (list)
              set area-countM-vector (list)
              set area-countF-vector (list)
              set wage-ratioMF-vector (list)
              set worker-ratioMF-vector (list)
              set farthest-vector (list)
              set closest-vector (list)
              set wageM-change 0
              set wageF-change 0
              set mean-comp-wage 0
              set eff 0
          ]] [
            discrimination-test-locations
    ]]]
    ] [
      ifelse Starting-locations = "Middle" [
        ask patch 0 0 [create-company 1]
        ask up-to-n-of (number-of-companies - 1) [neighbors4] of patch 0 0 [create-company 1]
        ask n-of (number-of-companies - 5) patches at-points [[-1 1] [-1 -1] [1 1] [1 -1]] [create-company 1]
      ] [
        ifelse Starting-locations = "Circle-max-2D" [
          create-ordered-companies number-of-companies [
            fd max-pxcor
            set shape "house"
            set size 2
            set pen-size 1
            set price base-market-price
            set wageM starting-wageM
            ifelse two-groups [
              ifelse discrimination [
                set wageF starting-wageF ][
                set wageF starting-wageM]][
              set wageF 0]
            ifelse two-groups [
              set wage-gapMF (wageM - wageF)
              ifelse wageF != 0 [
                set wage-ratioMF wageM / wageF][
                set wage-ratioMF "INF"]] [
              set wage-gapMF "NA"
              set wage-ratioMF "NA"]
            set fix-cost fix-cost-of-prod
            set counter 0
            set tot-dist 0
            set num-of-reloc 0
            set last-pos patch-here
            set profit 0
            set position-vector (list patch-here)
            set wageF-vector (list wageF)
            set wageM-vector (list wageM)
            set profit-vector (list)
            set area-countM-vector (list)
            set area-countF-vector (list)
            set wage-ratioMF-vector (list)
            set worker-ratioMF-vector (list)
            set farthest-vector (list)
            set closest-vector (list)
            set wageM-change 0
            set wageF-change 0
            set mean-comp-wage 0
            set eff 0
        ]] [
          ifelse Starting-locations = "Circle-2D" [
            create-ordered-companies number-of-companies [
              fd (((1 / 2) * (sqrt (1 + (sin(((pi / 2) - (2 * pi / number-of-companies)) * (180 / pi)) / 2)))) * max-pxcor)
              set shape "house"
              set size 2
              set pen-size 1
              set price base-market-price
              set wageM starting-wageM
              ifelse two-groups [
                ifelse discrimination [
                  set wageF starting-wageF ][
                  set wageF starting-wageM]][
                set wageF 0]
              ifelse two-groups [
                set wage-gapMF (wageM - wageF)
                ifelse wageF != 0 [
                  set wage-ratioMF wageM / wageF][
                  set wage-ratioMF "INF"]] [
                set wage-gapMF "NA"
                set wage-ratioMF "NA"]
              set fix-cost fix-cost-of-prod
              set counter 0
              set tot-dist 0
              set num-of-reloc 0
              set last-pos patch-here
              set profit 0
              set position-vector (list patch-here)
              set wageF-vector (list wageF)
              set wageM-vector (list wageM)
              set profit-vector (list)
              set area-countM-vector (list)
              set area-countF-vector (list)
              set wage-ratioMF-vector (list)
              set worker-ratioMF-vector (list)
              set farthest-vector (list)
              set closest-vector (list)
              set wageM-change 0
              set wageF-change 0
              set mean-comp-wage 0
              set eff 0
          ]] [
            discrimination-test-locations
          ]
        ]
      ]
  ]]


  set companies-new 0
  set companies-died 0
  set company-number count companies
  if efficiency [
    ifelse first/last-eff[
      ask min-n-of number-of-efficient-companies companies [who] [
        set eff 1
        set price (price * efficiency-factor)
    ]] [
      ask max-n-of number-of-efficient-companies companies [who] [
        set eff 1
        set price (price * efficiency-factor)]]]

  if number-of-companies = 2 [
    ask max-n-of number-of-efficient-companies companies [who] [
      set color red]
    ask min-n-of number-of-efficient-companies companies [who] [
      set color green]]

  set new-companies false
  set fix-cost-of-prod 0
  set cost-of-relocation 0
end

to create-company [ num ]

  sprout-companies num [
    set shape "house"
    set size 2
    set color one-of filter [ z -> not member? z [color] of companies ] base-colors
    set pen-size 1
    set price base-market-price
    set wageM starting-wageM
    ifelse two-groups [
      ifelse discrimination [
        set wageF starting-wageF ][
        set wageF starting-wageM]][
      set wageF 0]
    ifelse two-groups [
      set wage-gapMF (wageM - wageF)
      ifelse wageF != 0 [
        set wage-ratioMF wageM / wageF][
        set wage-ratioMF "INF"]] [
      set wage-gapMF "NA"
      set wage-ratioMF "NA"]
    set fix-cost fix-cost-of-prod
    set counter 0
    set tot-dist 0
    set num-of-reloc 0
    set last-pos patch-here
    set profit 0
    set position-vector (list patch-here)
    set wageF-vector (list wageF)
    set wageM-vector (list wageM)
    set profit-vector (list)
    set area-countM-vector (list)
    set area-countF-vector (list)
    set wage-ratioMF-vector (list)
    set worker-ratioMF-vector (list)
    set farthest-vector (list)
    set closest-vector (list)
    set wageM-change 0
    set wageF-change 0
    set mean-comp-wage 0
    set eff 0
  ]
end

to discrimination-test-locations
  ifelse number-of-companies = 2 [
    ifelse Starting-locations = "a-b-1" [
      ask patch (4 * (min-pxcor / 4)) 0 [create-company 1]
      ask patch (4 * (max-pxcor / 4)) 0 [create-company 1]] [
      ifelse Starting-locations = "a-b-2" [
        ask patch (4 * (min-pxcor / 4)) 0 [create-company 1]
        ask patch (3 * (max-pxcor / 4)) 0 [create-company 1]] [
        ifelse Starting-locations = "a-b-3" [
          ask patch (4 * (min-pxcor / 4)) 0 [create-company 1]
          ask patch (2 * (max-pxcor / 4)) 0 [create-company 1]] [
          ifelse Starting-locations = "a-b-4" [
            ask patch (4 * (min-pxcor / 4)) 0 [create-company 1]
            ask patch (1 * (max-pxcor / 4)) 0 [create-company 1]] [
            ifelse Starting-locations = "a-b-5" [
              ask patch (4 * (min-pxcor / 4)) 0 [create-company 1]
              ask patch (0 * (max-pxcor / 4)) 0 [create-company 1]] [
              ifelse Starting-locations = "a-b-6" [
                ask patch (3 * (min-pxcor / 4)) 0 [create-company 1]
                ask patch (4 * (max-pxcor / 4)) 0 [create-company 1]] [
                ifelse Starting-locations = "a-b-7" [
                  ask patch (3 * (min-pxcor / 4)) 0 [create-company 1]
                  ask patch (3 * (max-pxcor / 4)) 0 [create-company 1]] [
                  ifelse Starting-locations = "a-b-8" [
                    ask patch (3 * (min-pxcor / 4)) 0 [create-company 1]
                    ask patch (2 * (max-pxcor / 4)) 0 [create-company 1]] [
                    ifelse Starting-locations = "a-b-9" [
                      ask patch (3 * (min-pxcor / 4)) 0 [create-company 1]
                      ask patch (1 * (max-pxcor / 4)) 0 [create-company 1]] [
                      ifelse Starting-locations = "a-b-10" [
                        ask patch (3 * (min-pxcor / 4)) 0 [create-company 1]
                        ask patch (0 * (max-pxcor / 4)) 0 [create-company 1]] [
                        ifelse Starting-locations = "a-b-11" [
                          ask patch (2 * (min-pxcor / 4)) 0 [create-company 1]
                          ask patch (4 * (max-pxcor / 4)) 0 [create-company 1]] [
                          ifelse Starting-locations = "a-b-12" [
                            ask patch (2 * (min-pxcor / 4)) 0 [create-company 1]
                            ask patch (3 * (max-pxcor / 4)) 0 [create-company 1]] [
                            ifelse Starting-locations = "a-b-13" [
                              ask patch (2 * (min-pxcor / 4)) 0 [create-company 1]
                              ask patch (2 * (max-pxcor / 4)) 0 [create-company 1]] [
                              ifelse Starting-locations = "a-b-14" [
                                ask patch (2 * (min-pxcor / 4)) 0 [create-company 1]
                                ask patch (1 * (max-pxcor / 4)) 0 [create-company 1]] [
                                ifelse Starting-locations = "a-b-15" [
                                  ask patch (2 * (min-pxcor / 4)) 0 [create-company 1]
                                  ask patch (0 * (max-pxcor / 4)) 0 [create-company 1]] [
                                  ifelse Starting-locations = "a-b-16" [
                                    ask patch (1 * (min-pxcor / 4)) 0 [create-company 1]
                                    ask patch (4 * (max-pxcor / 4)) 0 [create-company 1]] [
                                    ifelse Starting-locations = "a-b-17" [
                                      ask patch (1 * (min-pxcor / 4)) 0 [create-company 1]
                                      ask patch (3 * (max-pxcor / 4)) 0 [create-company 1]] [
                                      ifelse Starting-locations = "a-b-18" [
                                        ask patch (1 * (min-pxcor / 4)) 0 [create-company 1]
                                        ask patch (2 * (max-pxcor / 4)) 0 [create-company 1]] [
                                        ifelse Starting-locations = "a-b-19" [
                                          ask patch (1 * (min-pxcor / 4)) 0 [create-company 1]
                                          ask patch (1 * (max-pxcor / 4)) 0 [create-company 1]] [
                                          ifelse Starting-locations = "a-b-20" [
                                            ask patch (1 * (min-pxcor / 4)) 0 [create-company 1]
                                            ask patch (0 * (max-pxcor / 4)) 0 [create-company 1]] [
                                            ifelse Starting-locations = "a-b-21" [
                                              ask patch (0 * (min-pxcor / 4)) 0 [create-company 1]
                                              ask patch (4 * (max-pxcor / 4)) 0 [create-company 1]] [
                                              ifelse Starting-locations = "a-b-22" [
                                                ask patch (0 * (min-pxcor / 4)) 0 [create-company 1]
                                                ask patch (3 * (max-pxcor / 4)) 0 [create-company 1]] [
                                                ifelse Starting-locations = "a-b-23" [
                                                  ask patch (0 * (min-pxcor / 4)) 0 [create-company 1]
                                                  ask patch (2 * (max-pxcor / 4)) 0 [create-company 1]] [
                                                  ifelse Starting-locations = "a-b-24" [
                                                    ask patch (0 * (min-pxcor / 4)) 0 [create-company 1]
                                                    ask patch (1 * (max-pxcor / 4)) 0 [create-company 1]] [
                                                    ifelse Starting-locations = "a-b-25" [
                                                      ask patch (0 * (min-pxcor / 4)) 0 [create-company 1]
                                                      ask patch (0 * (max-pxcor / 4)) 0 [create-company 1]] [
                                                      mm-test-locations
  ]]]]]]]]]]]]]]]]]]]]]]]]]] [
    simmetric-3-locations]
end

to mm-test-locations
  ifelse number-of-companies = 2 [
    ifelse Starting-locations = "mm-1" [
      ask patch (4 * (min-pxcor / 4)) 0 [create-company 1]
      ask patch (4 * (max-pxcor / 4)) (0 * (max-pycor / 4)) [create-company 1]] [
      ifelse Starting-locations = "mm-2" [
        ask patch (4 * (min-pxcor / 4)) 0 [create-company 1]
        ask patch (4 * (max-pxcor / 4)) (1 * (max-pycor / 4)) [create-company 1]] [
        ifelse Starting-locations = "mm-3" [
          ask patch (4 * (min-pxcor / 4)) 0 [create-company 1]
          ask patch (4 * (max-pxcor / 4)) (2 * (max-pycor / 4)) [create-company 1]] [
          ifelse Starting-locations = "mm-4" [
            ask patch (4 * (min-pxcor / 4)) 0 [create-company 1]
            ask patch (4 * (max-pxcor / 4)) (3 * (max-pycor / 4)) [create-company 1]] [
            ifelse Starting-locations = "mm-5" [
              ask patch (4 * (min-pxcor / 4)) 0 [create-company 1]
              ask patch (4 * (max-pxcor / 4)) (4 * (max-pycor / 4)) [create-company 1]] [
              ifelse Starting-locations = "mm-6" [
                ask patch (4 * (min-pxcor / 4)) (1 * (min-pxcor / 4)) [create-company 1]
                ask patch (4 * (max-pxcor / 4)) (0 * (max-pycor / 4)) [create-company 1]] [
                ifelse Starting-locations = "mm-7" [
                  ask patch (4 * (min-pxcor / 4)) (1 * (min-pxcor / 4)) [create-company 1]
                  ask patch (4 * (max-pxcor / 4)) (1 * (max-pycor / 4)) [create-company 1]] [
                  ifelse Starting-locations = "mm-8" [
                    ask patch (4 * (min-pxcor / 4)) (1 * (min-pxcor / 4)) [create-company 1]
                    ask patch (4 * (max-pxcor / 4)) (2 * (max-pycor / 4)) [create-company 1]] [
                    ifelse Starting-locations = "mm-9" [
                      ask patch (4 * (min-pxcor / 4)) (1 * (min-pxcor / 4)) [create-company 1]
                      ask patch (4 * (max-pxcor / 4)) (3 * (max-pycor / 4)) [create-company 1]] [
                      ifelse Starting-locations = "mm-10" [
                        ask patch (4 * (min-pxcor / 4)) (1 * (min-pxcor / 4)) [create-company 1]
                        ask patch (4 * (max-pxcor / 4)) (4 * (max-pycor / 4)) [create-company 1]] [
                        ifelse Starting-locations = "mm-11" [
                          ask patch (4 * (min-pxcor / 4)) (2 * (min-pxcor / 4)) [create-company 1]
                          ask patch (4 * (max-pxcor / 4)) (0 * (max-pycor / 4)) [create-company 1]] [
                          ifelse Starting-locations = "mm-12" [
                            ask patch (4 * (min-pxcor / 4)) (2 * (min-pxcor / 4)) [create-company 1]
                            ask patch (4 * (max-pxcor / 4)) (1 * (max-pycor / 4)) [create-company 1]] [
                            ifelse Starting-locations = "mm-13" [
                              ask patch (4 * (min-pxcor / 4)) (2 * (min-pxcor / 4)) [create-company 1]
                              ask patch (4 * (max-pxcor / 4)) (2 * (max-pycor / 4)) [create-company 1]] [
                              ifelse Starting-locations = "mm-14" [
                                ask patch (4 * (min-pxcor / 4)) (2 * (min-pxcor / 4)) [create-company 1]
                                ask patch (4 * (max-pxcor / 4)) (3 * (max-pycor / 4)) [create-company 1]] [
                                ifelse Starting-locations = "mm-15" [
                                  ask patch (4 * (min-pxcor / 4)) (2 * (min-pxcor / 4)) [create-company 1]
                                  ask patch (4 * (max-pxcor / 4)) (4 * (max-pycor / 4)) [create-company 1]] [
                                  ifelse Starting-locations = "mm-16" [
                                    ask patch (4 * (min-pxcor / 4)) (3 * (min-pxcor / 4)) [create-company 1]
                                    ask patch (4 * (max-pxcor / 4)) (0 * (max-pycor / 4)) [create-company 1]] [
                                    ifelse Starting-locations = "mm-17" [
                                      ask patch (4 * (min-pxcor / 4)) (3 * (min-pxcor / 4)) [create-company 1]
                                      ask patch (4 * (max-pxcor / 4)) (1 * (max-pycor / 4)) [create-company 1]] [
                                      ifelse Starting-locations = "mm-18" [
                                        ask patch (4 * (min-pxcor / 4)) (3 * (min-pxcor / 4)) [create-company 1]
                                        ask patch (4 * (max-pxcor / 4)) (2 * (max-pycor / 4)) [create-company 1]] [
                                        ifelse Starting-locations = "mm-19" [
                                          ask patch (4 * (min-pxcor / 4)) (3 * (min-pxcor / 4)) [create-company 1]
                                          ask patch (4 * (max-pxcor / 4)) (3 * (max-pycor / 4)) [create-company 1]] [
                                          ifelse Starting-locations = "mm-20" [
                                            ask patch (4 * (min-pxcor / 4)) (3 * (min-pxcor / 4)) [create-company 1]
                                            ask patch (4 * (max-pxcor / 4)) (4 * (max-pycor / 4)) [create-company 1]] [
                                            ifelse Starting-locations = "mm-21" [
                                              ask patch (4 * (min-pxcor / 4)) (4 * (min-pxcor / 4)) [create-company 1]
                                              ask patch (4 * (max-pxcor / 4)) (0 * (max-pycor / 4)) [create-company 1]] [
                                              ifelse Starting-locations = "mm-22" [
                                                ask patch (4 * (min-pxcor / 4)) (4 * (min-pxcor / 4)) [create-company 1]
                                                ask patch (4 * (max-pxcor / 4)) (1 * (max-pycor / 4)) [create-company 1]] [
                                                ifelse Starting-locations = "mm-23" [
                                                  ask patch (4 * (min-pxcor / 4)) (4 * (min-pxcor / 4)) [create-company 1]
                                                  ask patch (4 * (max-pxcor / 4)) (2 * (max-pycor / 4)) [create-company 1]] [
                                                  ifelse Starting-locations = "mm-24" [
                                                    ask patch (4 * (min-pxcor / 4)) (4 * (min-pxcor / 4)) [create-company 1]
                                                    ask patch (4 * (max-pxcor / 4)) (3 * (max-pycor / 4)) [create-company 1]] [
                                                    ifelse Starting-locations = "mm-25" [
                                                      ask patch (4 * (min-pxcor / 4)) (4 * (min-pxcor / 4)) [create-company 1]
                                                      ask patch (4 * (max-pxcor / 4)) (4 * (max-pycor / 4)) [create-company 1]] [
                                                      step-by-step-locations
  ]]]]]]]]]]]]]]]]]]]]]]]]]] [
    simmetric-3-locations]
end

to step-by-step-locations
  ifelse number-of-companies = 2 [
    ifelse Starting-locations = "sbs-1" [
      ask patch min-pxcor 0 [create-company 1]
      ask patch (20 * (max-pxcor / 20)) 0 [create-company 1]] [
      ifelse Starting-locations = "sbs-2" [
        ask patch min-pxcor 0 [create-company 1]
        ask patch (19 * (max-pxcor / 20)) 0 [create-company 1]] [
        ifelse Starting-locations = "sbs-3" [
          ask patch min-pxcor 0 [create-company 1]
          ask patch (18 * (max-pxcor / 20)) 0 [create-company 1]] [
          ifelse Starting-locations = "sbs-4" [
            ask patch min-pxcor 0 [create-company 1]
            ask patch (17 * (max-pxcor / 20)) 0 [create-company 1]] [
            ifelse Starting-locations = "sbs-5" [
              ask patch min-pxcor 0 [create-company 1]
              ask patch (16 * (max-pxcor / 20)) 0 [create-company 1]] [
              ifelse Starting-locations = "sbs-6" [
                ask patch min-pxcor 0 [create-company 1]
                ask patch (15 * (max-pxcor / 20)) 0 [create-company 1]] [
                ifelse Starting-locations = "sbs-7" [
                  ask patch min-pxcor 0 [create-company 1]
                  ask patch (14 * (max-pxcor / 20)) 0 [create-company 1]] [
                  ifelse Starting-locations = "sbs-8" [
                    ask patch min-pxcor 0 [create-company 1]
                    ask patch (13 * (max-pxcor / 20)) 0 [create-company 1]] [
                    ifelse Starting-locations = "sbs-9" [
                      ask patch min-pxcor 0 [create-company 1]
                      ask patch (12 * (max-pxcor / 20)) 0 [create-company 1]] [
                      ifelse Starting-locations = "sbs-10" [
                        ask patch min-pxcor 0 [create-company 1]
                        ask patch (11 * (max-pxcor / 20)) 0 [create-company 1]] [
                        ifelse Starting-locations = "sbs-11" [
                          ask patch min-pxcor 0 [create-company 1]
                          ask patch (10 * (max-pxcor / 20)) 0 [create-company 1]] [
                          ifelse Starting-locations = "sbs-12" [
                            ask patch min-pxcor 0 [create-company 1]
                            ask patch (9 * (max-pxcor / 20)) 0 [create-company 1]] [
                            ifelse Starting-locations = "sbs-13" [
                              ask patch min-pxcor 0 [create-company 1]
                              ask patch (8 * (max-pxcor / 20)) 0 [create-company 1]] [
                              ifelse Starting-locations = "sbs-14" [
                                ask patch min-pxcor 0 [create-company 1]
                                ask patch (7 * (max-pxcor / 20)) 0 [create-company 1]] [
                                ifelse Starting-locations = "sbs-15" [
                                  ask patch min-pxcor 0 [create-company 1]
                                  ask patch (6 * (max-pxcor / 20)) 0 [create-company 1]] [
                                  ifelse Starting-locations = "sbs-16" [
                                    ask patch min-pxcor 0 [create-company 1]
                                    ask patch (5 * (max-pxcor / 20)) 0 [create-company 1]] [
                                    ifelse Starting-locations = "sbs-17" [
                                      ask patch min-pxcor 0 [create-company 1]
                                      ask patch (4 * (max-pxcor / 20)) 0 [create-company 1]] [
                                      ifelse Starting-locations = "sbs-18" [
                                        ask patch min-pxcor 0 [create-company 1]
                                        ask patch (3 * (max-pxcor / 20)) 0 [create-company 1]] [
                                        ifelse Starting-locations = "sbs-19" [
                                          ask patch min-pxcor 0 [create-company 1]
                                          ask patch (2 * (max-pxcor / 20)) 0 [create-company 1]] [
                                          ifelse Starting-locations = "sbs-20" [
                                            ask patch min-pxcor 0 [create-company 1]
                                            ask patch (1 * (max-pxcor / 20)) 0 [create-company 1]] [
                                            close-up-simmetric-locations
  ]]]]]]]]]]]]]]]]]]]]] [
    simmetric-3-locations]
end




to close-up-simmetric-locations
  ifelse number-of-companies = 2 [
    ifelse Starting-locations = "close-up-1" [
      ask patch -4 0 [create-company 1]
      ask patch 4 0 [create-company 1]] [
      ifelse Starting-locations = "close-up-2" [
        ask patch -3 0 [create-company 1]
        ask patch 3 0 [create-company 1]] [
        ifelse Starting-locations = "close-up-3" [
          ask patch -2 0 [create-company 1]
          ask patch 2 0 [create-company 1]] [
          ifelse Starting-locations = "close-up-4" [
            ask patch -1 0 [create-company 1]
            ask patch 1 0 [create-company 1]] [
            ask n-of number-of-companies market [create-company 1]]
  ]]]] [
  simmetric-3-locations ]
end

to simmetric-3-locations
  ifelse number-of-companies = 3 [
    ifelse Starting-locations = "sim-3-1" [
      ask patch 0 0 [create-company 1]
      ask patch (5 * (min-pxcor / 5)) 0 [create-company 1]
      ask patch (5 * (max-pxcor / 5)) 0 [create-company 1]] [
      ifelse Starting-locations = "sim-3-2" [
        ask patch 0 0 [create-company 1]
        ask patch (4 * (min-pxcor / 5)) 0 [create-company 1]
        ask patch (4 * (max-pxcor / 5)) 0 [create-company 1]] [
        ifelse Starting-locations = "sim-3-3" [
          ask patch 0 0 [create-company 1]
          ask patch (3 * (min-pxcor / 5)) 0 [create-company 1]
          ask patch (3 * (max-pxcor / 5)) 0 [create-company 1]] [
          ifelse Starting-locations = "sim-3-4" [
            ask patch 0 0 [create-company 1]
            ask patch (2 * (min-pxcor / 5)) 0 [create-company 1]
            ask patch (2 * (max-pxcor / 5)) 0 [create-company 1]] [
            ifelse Starting-locations = "sim-3-5" [
              ask patch 0 0 [create-company 1]
              ask patch (1 * (min-pxcor / 5)) 0 [create-company 1]
              ask patch (1 * (max-pxcor / 5)) 0 [create-company 1]] [
            ask n-of number-of-companies market [create-company 1]]
  ]]]]] [
   simmetric-5-locations ]
end

to simmetric-5-locations
   ifelse number-of-companies = 5 [
    ifelse Starting-locations = "sim-5-1" [
      ask patch 0 0 [create-company 1]
      ask patch (8 * (min-pxcor / 8)) 0 [create-company 1]
      ask patch (8 * (max-pxcor / 8)) 0 [create-company 1]
      ask patch 0 (8 * (min-pycor / 8)) [create-company 1]
      ask patch 0 (8 * (max-pycor / 8)) [create-company 1]] [
      ifelse Starting-locations = "sim-5-2" [
        ask patch 0 0 [create-company 1]
        ask patch (floor (7 * (min-pxcor / 8))) 0 [create-company 1]
        ask patch (ceiling (7 * (max-pxcor / 8))) 0 [create-company 1]
        ask patch 0 (floor (7 * (min-pycor / 8))) [create-company 1]
        ask patch 0 (ceiling (7 * (max-pycor / 8))) [create-company 1]] [
        ifelse Starting-locations = "sim-5-3" [
          ask patch 0 0 [create-company 1]
          ask patch (floor (6 * (min-pxcor / 8))) 0 [create-company 1]
          ask patch (ceiling (6 * (max-pxcor / 8))) 0 [create-company 1]
          ask patch 0 (floor (6 * (min-pycor / 8))) [create-company 1]
          ask patch 0 (ceiling (6 * (max-pycor / 8))) [create-company 1]] [
          ifelse Starting-locations = "sim-5-4" [
            ask patch 0 0 [create-company 1]
            ask patch (floor (5 * (min-pxcor / 8))) 0 [create-company 1]
            ask patch (ceiling (5 * (max-pxcor / 8))) 0 [create-company 1]
            ask patch 0 (floor (5 * (min-pycor / 8))) [create-company 1]
            ask patch 0 (ceiling (5 * (max-pycor / 8))) [create-company 1]] [
            ifelse Starting-locations = "sim-5-5" [
              ask patch 0 0 [create-company 1]
              ask patch (floor (4 * (min-pxcor / 8))) 0 [create-company 1]
              ask patch (ceiling (4 * (max-pxcor / 8))) 0 [create-company 1]
              ask patch 0 (floor (4 * (min-pycor / 8))) [create-company 1]
              ask patch 0 (ceiling (4 * (max-pycor / 8))) [create-company 1]] [
              ask n-of number-of-companies market [create-company 1]]
  ]]]]] [
    ask n-of number-of-companies market [create-company 1]]
end

;;;;;;;;;;;;;;;;;;
;;;;;;;;Go;;;;;;;;
;;;;;;;;;;;;;;;;;;

to go

  mark-positions

  let changes ifelse-value rules = "both"
      [ [ new-location-and-wages-task ] of companies ]
  [ (list) ]

  let location-changes ifelse-value rules = "moving-only"
      [ [ new-location-task ] of companies ]
  [ (list) ]

  let wage-changes ifelse-value rules = "pricing-only"
    [ [ new-wage-task ] of companies ]
  [ (list) ]

  foreach changes run
  foreach location-changes run
  foreach wage-changes run

  recalculate-areas
  recalculate-profit
  recalculate-market-state
  recalculate-wage-ratio
  recalculate-rolling-averages

  if new-companies = TRUE [
    kill-companies
    create-new-companies ]
  tick

end

;;;;;;;;;;;;;;;;;;;;;
;;;;;Other tasks;;;;;
;;;;;;;;;;;;;;;;;;;;;


to recalculate-areas

  ask workers [
    let ch-comp-vek choose-company companies
    set preferred-company item 0 ch-comp-vek
    set realised-income item 1 ch-comp-vek
    set alt-comp item 2 ch-comp-vek
    ifelse not worker-reservation [
      set competetive-income item 3 ch-comp-vek][
      set competetive-income max (list (item 3 ch-comp-vek) 0)]
    ifelse preferred-company != nobody [
      set color ([color] of preferred-company ) ] [
      set color black ]]
  ask market [
    set sum-income-here (sum [realised-income] of workers-here)  ;; Ez nem jó ha az eloszlások nem egyenletesek!!
    set patch-comp-dist min [distance myself] of companies]
  set unemployed workers with [preferred-company = nobody]
  ask companies [
    ifelse two-groups [
      set area-countF count workers with [ gender = 1 and preferred-company = myself ]][
      set area-countF 0]
    set area-countM count workers with [ gender = 0 and preferred-company = myself ]
    set num-of-employees (area-countF + area-countM)
    let last-mean-comp-wage mean-comp-wage
    ifelse num-of-employees != 0 [
        ifelse two-groups [
        set employee-ratioF (area-countF / num-of-employees)
        set employee-ratioM (area-countM / num-of-employees)
        ifelse discrimination [
          set mean-comp-wage (((wageF * area-countF) + (wageM * area-countM)) / num-of-employees)][
          set mean-comp-wage wageM]] [
        set employee-ratioF 0
        set employee-ratioM 1
        set mean-comp-wage wageM ]] [
      set employee-ratioF 0
      set employee-ratioM 0
      set mean-comp-wage 0]
      set mean-comp-wage-change (mean-comp-wage - last-mean-comp-wage)
    set comp-dist-vek sort-by [ [a b] -> a < b ] [distance myself] of other companies
    set mid-dist distancexy 0 0
    set last-dist [distance myself] of last-pos
    set tot-dist (tot-dist + last-dist)
    if last-dist > 0 [
      set num-of-reloc (num-of-reloc + 1)]

  ]
end

to recalculate-profit
  ask companies [
    let last-profit profit
    ifelse last-pos != patch-here [
      set profit (area-countF * (price - wageF) + area-countM * (price - wageM) - fix-cost - cost-of-relocation)] [
      set profit (area-countF * (price - wageF) + area-countM * (price - wageM) - fix-cost)]
    set profit-change (profit - last-profit)]
  set mean-profit (mean [profit] of companies)
  set max-profit (max [profit] of companies)
  set min-profit (min [profit] of companies)
end

to recalculate-market-state
  set tot-employment sum [num-of-employees] of companies
  set tot-employmentF sum [area-countF] of companies
  set tot-employmentM tot-employment - tot-employmentF
  set mean-employment (tot-employment / company-number)
  ifelse (count workers with [gender = 1]) = 0 [
    set employment-rateF 0 ] [
    set employment-rateF (sum [area-countF] of companies) / (count workers with [gender = 1])]
  ifelse (count workers with [gender = 0]) = 0 [
    set employment-rateM 0 ] [
    set employment-rateM (sum [area-countM] of companies) / (count workers with [gender = 0])]
  ifelse (count workers with [gender = 1]) = 0 or (count workers with [gender = 0]) = 0 [
    set employment-ratioMF "NA" ] [
    ifelse tot-employmentF = 0 [
      set employment-ratioMF "NA"][
      set employment-ratioMF (tot-employmentM / tot-employmentF) ]]
  ifelse two-groups [
    ifelse tot-employmentF = 0 [
      set mean-wageF 0 ][
      set mean-wageF ((sum [wageF * area-countF] of companies) / tot-employmentF)]][
    set mean-wageF "NA" ]
  ifelse tot-employmentM = 0 [
    set mean-wageM 0 ][
    set mean-wageM ((sum [wageM * area-countM] of companies) / tot-employmentM)]
  ifelse tot-employmentM = 0 and tot-employmentF = 0 [
    set mean-wage "NA" ][
    set mean-wage ((sum [wageM * area-countM] of companies + sum [wageF * area-countF] of companies) / (tot-employment)) ]
  set employment-rate tot-employment / count workers
  set max-wageM (max [wageM] of companies)
  set max-wageF (max [wageF] of companies)
  set min-wageM (max [wageM] of companies)
  set min-wageF (max [wageF] of companies)
end

to recalculate-wage-ratio
  ask companies [ if two-groups [ ifelse wageF != 0 [ set wage-ratioMF wageM / wageF ] [set wage-ratioMF "INF"]]
    if two-groups [set wage-gapMF (wageM - wageF)]]
end

to kill-companies
  ask companies [
    ifelse profit < 0 [
      set counter counter + 1 ] [
      set counter 0 ]
    if counter >= 1 [
      if random-float 1 < 0.5 [
        die ]]]
  let current-comp-num count companies
  set companies-died (companies-died + company-number - current-comp-num)
  set company-number current-comp-num
end

to create-new-companies
  if company-number < 14 [
    if (random-float 1) < 0.02 [
      let pot-prof 0
      let u min-one-of market [sum-income-here]
      let dis [patch-comp-dist] of u
      ask one-of market with [patch-comp-dist >= 0.6 * dis] [
        sprout-companies 1 [
          set price base-market-price
          set wageM round mean-wageM
          ifelse efficiency [
            ifelse random-float 1 < 0.5 [
              set eff 1
              set price price * efficiency-factor ] [
              set eff 0 ]] [
            set eff 0]
          ifelse two-groups [
            ifelse discrimination [
              set wageF round mean-wageF ][
              set wageF round mean-wageM]][
            set wageF 0]
          set fix-cost fix-cost-of-prod
          set pot-prof potential-profit 0
          ifelse pot-prof <= 0 [
            die ] [
            set shape "house"
            set size 2
            set color one-of filter [ z -> not member? z [color] of companies ] base-colors
            set pen-size 1
            ifelse two-groups [
              set wage-gapMF (wageM - wageF)
              ifelse wageF != 0 [
                set wage-ratioMF wageM / wageF] [
                set wage-ratioMF "INF"]][
              set wage-gapMF "NA"
              set wage-ratioMF "NA"]
            set counter 0
            set tot-dist 0
            set num-of-reloc 0
            set last-pos patch-here
            set profit 0
            set position-vector (list patch-here)
            set wageF-vector (list wageF)
            set wageM-vector (list wageM)
            set profit-vector (list)
            set area-countM-vector (list)
            set area-countF-vector (list)
            set wage-ratioMF-vector (list)
            set worker-ratioMF-vector (list)
            set farthest-vector (list)
            set closest-vector (list)
            set wageM-change 0
            set wageF-change 0
            set mean-comp-wage 0 ]]]
      if pot-prof > 0 [
        set companies-new (companies-new + 1) ]
      set company-number count companies]]
end

to mark-positions
  ask companies [ set last-pos patch-here]
end

to recalculate-rolling-averages

  let distances (list)

  ask companies [
    let comp self
    ifelse length profit-vector < 100 [

      set profit-vector lput profit profit-vector
      set ra-profit mean profit-vector

      set area-countF-vector lput area-countF area-countF-vector
      set area-countM-vector lput area-countM area-countM-vector
      set ra-area-countF mean area-countF-vector
      set ra-area-countM mean area-countM-vector
      set closest-vector lput first comp-dist-vek closest-vector
      set farthest-vector lput last comp-dist-vek farthest-vector
      set closest-mean mean closest-vector
      set farthest-mean mean farthest-vector

      if two-groups [
        set wage-ratioMF-vector lput min (list wage-ratioMF 100000) wage-ratioMF-vector
        set ra-wage-ratioMF mean wage-ratioMF-vector

        set worker-ratioMF-vector lput (area-countM / max (list 0.0001 area-countF)) worker-ratioMF-vector
        set ra-worker-ratioMF mean worker-ratioMF-vector]
    ]
    [
      set profit-vector remove-item 0 profit-vector
      set profit-vector lput profit profit-vector
      set ra-profit mean profit-vector

      set area-countF-vector remove-item 0 area-countF-vector
      set area-countM-vector remove-item 0 area-countM-vector
      set area-countF-vector lput area-countF area-countF-vector
      set area-countM-vector lput area-countM area-countM-vector
      set ra-area-countF mean area-countF-vector
      set ra-area-countM mean area-countM-vector
      set closest-vector remove-item 0 closest-vector
      set farthest-vector remove-item 0 farthest-vector
      set closest-vector lput first comp-dist-vek closest-vector
      set farthest-vector lput last comp-dist-vek farthest-vector
      set closest-mean mean closest-vector
      set farthest-mean mean farthest-vector

      if two-groups [
        set wage-ratioMF-vector remove-item 0 wage-ratioMF-vector
        set wage-ratioMF-vector lput min (list wage-ratioMF 100000) wage-ratioMF-vector
        set ra-wage-ratioMF mean wage-ratioMF-vector

        set worker-ratioMF-vector remove-item 0 worker-ratioMF-vector
        set worker-ratioMF-vector lput (area-countM / max (list 0.0001 area-countF)) worker-ratioMF-vector
        set ra-worker-ratioMF mean worker-ratioMF-vector]
    ]

    ifelse length wageM-vector < 100 [

      set wageM-vector lput wageM wageM-vector
      set ra-wageM mean wageM-vector
      if (price - ra-wageM) != 0 [
        set d-wM max (list (((price - (min wageM-vector)) / (price - ra-wageM)) - 1) (1 - ((price - (max wageM-vector)) / (price - ra-wageM))))]

      if two-groups [
        set wageF-vector lput wageF wageF-vector
        set ra-wageF mean wageF-vector
        if (price - ra-wageF) != 0 [
          set d-wF max (list (((price - (min wageF-vector)) / (price - ra-wageF)) - 1) (1 - ((price - (max wageF-vector)) / (price - ra-wageF))))]]] [

      set wageM-vector remove-item 0 wageM-vector
      set wageM-vector lput wageM wageM-vector
      set ra-wageM mean wageM-vector
      if (price - ra-wageM) != 0 [
        set d-wM max (list (((price - (min wageM-vector)) / (price - ra-wageM)) - 1) (1 - ((price - (max wageM-vector)) / (price - ra-wageM))))]

      if two-groups [
        set wageF-vector remove-item 0 wageF-vector
        set wageF-vector lput wageF wageF-vector
        set ra-wageF mean wageF-vector
        if (price - ra-wageF) != 0 [
          set d-wF max (list (((price - (min wageF-vector)) / (price - ra-wageF)) - 1) (1 - ((price - (max wageF-vector)) / (price - ra-wageF))))]]]

    if not (rules = "pricing-only") [
      ifelse length position-vector < 200 [
        set position-vector lput patch-here position-vector
        set distances map [i -> [distance comp] of i] position-vector
        set didtance-over-time max distances]
      [
        set position-vector remove-item 0 position-vector
        set position-vector lput patch-here position-vector
        set distances map [i -> [distance comp] of i] position-vector
        set didtance-over-time max distances
    ]]
  ]
end

;;;;;;;;;;;;;;;;;;;
;;;;;Reporters;;;;;
;;;;;;;;;;;;;;;;;;;

to-report choose-company [ company-set ]  ;; nagy futásigény, worker procedure

  ifelse count company-set = 1 [
    let the-company nobody
    ifelse gender = 0 [
      ifelse distance-calculation = "Linear" [
        set the-company max-one-of company-set [ (wageM) - (([tcost] of myself) * (distance myself)) ]] [
        ifelse distance-calculation = "Squared" [
          set the-company max-one-of company-set [ (wageM) - ((([tcost] of myself) * (distance myself)) ^ 2)]] [
          set the-company max-one-of company-set [ (wageM) - (([tcost] of myself) * (distance myself)) ]]]]
    [
      ifelse distance-calculation = "Linear" [
        set the-company max-one-of company-set [ (wageF) - (([tcost] of myself) * (distance myself)) ]] [
        ifelse distance-calculation = "Squared" [
          set the-company max-one-of company-set [ (wageF) - ((([tcost] of myself) * (distance myself)) ^ 2)]] [
          set the-company max-one-of company-set [ (wageF) - ((([tcost] of myself) * (distance myself)) ^ 2)]]]]
    let income pincome the-company
    ifelse not worker-reservation [
      report (list the-company income nobody -100000)
    ][
    ifelse income >= 0 [
      report (list the-company income nobody 0) ] [
      report (list nobody income nobody 0) ]
  ]]
  [
    let the-companies nobody
    ifelse gender = 0 [
      ifelse distance-calculation = "Linear" [
        set the-companies max-n-of 2 company-set [ (wageM) - (([tcost] of myself) * (distance myself)) ]] [
        ifelse distance-calculation = "Squared" [
          set the-companies max-n-of 2 company-set [ (wageM) - ((([tcost] of myself) * (distance myself)) ^ 2)]] [
          set the-companies max-n-of 2 company-set [ (wageM) - (([tcost] of myself) * (distance myself)) ]]]]
    [
      ifelse distance-calculation = "Linear" [
        set the-companies max-n-of 2 company-set [ (wageF) - (([tcost] of myself) * (distance myself)) ]] [
        ifelse distance-calculation = "Squared" [
          set the-companies max-n-of 2 company-set [ (wageF) - ((([tcost] of myself) * (distance myself)) ^ 2)]] [
          set the-companies max-n-of 2 company-set [ (wageF) - ((([tcost] of myself) * (distance myself)) ^ 2)]]]]

    let sorted
      sort-by [ [a b] -> pincome a > pincome b ] the-companies ;; ties broken randomly

    let income1 (pincome (item 0 sorted))
    let income2 (pincome (item 1 sorted))


    ifelse not worker-reservation [
      report (list (item 0 sorted) income1 (item 1 sorted) income2)
    ][
    ifelse income1 >= 0 [
      ifelse income2 >= 0 [
        report (list (item 0 sorted) income1 (item 1 sorted) income2) ][
        report (list (item 0 sorted) income1 nobody income2) ]][
        report (list nobody income1 nobody income2) ]
  ]]

end

to-report pincome [ a-company ] ;; kis futásigény, worker procedure

  ifelse two-groups [
    ifelse gender = 0 [
      ifelse distance-calculation = "Linear" [
        report (([wageM] of a-company) - ((tcost) * (distance a-company)) - reservation) ] [
        ifelse distance-calculation = "Squared" [
          report (([wageM] of a-company) - ((tcost * (distance a-company)) ^ 2) - reservation) ] [
          report (([wageM] of a-company) - ((tcost) * (distance a-company)) - reservation) ]]]
    [
      ifelse distance-calculation = "Linear" [
        report (([wageF] of a-company) - ((tcost) * (distance a-company)) - reservation) ] [
        ifelse distance-calculation = "Squared" [
          report (([wageF] of a-company) - ((tcost * (distance a-company)) ^ 2) - reservation) ] [
          report (([wageF] of a-company) - ((tcost * (distance a-company)) ^ 2) - reservation) ]]]]
  [
    ifelse distance-calculation = "Linear" [
      report (([wageM] of a-company) - ((tcost) * (distance a-company)) - reservation) ] [
      ifelse distance-calculation = "Squared" [
        report (([wageM] of a-company) - ((tcost * (distance a-company)) ^ 2) - reservation) ] [
        report (([wageM] of a-company) - ((tcost) * (distance a-company)) - reservation) ]]]
end

to-report new-location-and-wages-task

  let possible-moves (list)
  ifelse random-float 1 < 0.5 [
    set possible-moves (list patch-here) ] [
    set possible-moves [ self ] of neighbors4 with [ member? self market and not any? companies-here ]
    ifelse count companies-on patch-here > 1 [
      if random-float 1 < 0.8 [
        set possible-moves fput patch-here possible-moves ]] [
      set possible-moves fput patch-here possible-moves]
    let n-comp companies with [distance myself = 1]
    if any? n-comp [
      let jumps [self] of patches with [member? self market and (min-dist n-comp) = 1 and not (member? self possible-moves)]
      if length jumps > 0 [
        let k 0
        while [ k < length jumps] [
          set possible-moves lput item k jumps possible-moves
          set k (k + 1) ]]] ;]

    if random-float 1 < 0.6 [
      let u min-one-of market [sum-income-here]
      let dis [patch-comp-dist] of u
      let potentials market with [not (member? self possible-moves) and patch-comp-dist >= 0.2 * dis]
      set possible-moves lput (one-of potentials) possible-moves
  ]]

  let possible-moves-with-wages (list)
  ifelse two-groups [
    ifelse discrimination [
      let possible-wagesM fput (max (list 0 (wageM))) shuffle (list (max (list 0 (wageM - wage-surplusM))) (max (list 0 (wageM + wage-deficitM))) (max (list 0 (wageM + cutting-wageM))))
      let possible-wagesF fput (max (list 0 (wageF))) shuffle (list (max (list 0 (wageF - wage-surplusF))) (max (list 0 (wageF + wage-deficitF))) (max (list 0 (wageF + cutting-wageF))))

      let l 0
      let j 0
      let k 0
      while [l < length(possible-moves)] [
        while [j < length(possible-wagesF)] [
          while [k < length(possible-wagesM)] [
            set possible-moves-with-wages lput (list (item l possible-moves) (item j possible-wagesF) (item k possible-wagesM)) possible-moves-with-wages
            set k (k + 1) ]
          set j (j + 1)
          set k 0 ]
        set l (l + 1)
        set k 0
        set j 0 ]
    ][
      let possible-wages fput (max (list 0 (wageM))) shuffle (list (max (list 0 (wageM - wage-surplus))) (max (list 0 (wageM + wage-deficit))) (max (list 0 (wageM + cutting-wage))))

      let l 0
      let j 0
      while [l < length(possible-moves)] [
        while [j < length(possible-wages)] [
          set possible-moves-with-wages lput (list (item l possible-moves) (item j possible-wages)) possible-moves-with-wages
          set j (j + 1)]
        set l (l + 1)
        set j 0]]
  ][
    let possible-wagesM fput (max (list 0 (wageM))) shuffle (list (max (list 0 (wageM - wage-surplusM))) (max (list 0 (wageM + wage-deficitM))) (max (list 0 (wageM + cutting-wageM))))

    let l 0
    let j 0
    while [l < length(possible-moves)] [
      while [j < length(possible-wagesM)] [
        set possible-moves-with-wages lput (list (item l possible-moves) (item j possible-wagesM)) possible-moves-with-wages
        set j (j + 1)]
      set l (l + 1)
      set j 0]]

  let decisions-with-profits
  sort-by [ [a b] -> last a > last b ]
  map [ decision -> list decision (profit-if-made-decision decision) ] possible-moves-with-wages

  let comp self
  let last-wageM wageM
  let last-wageF wageF
  ifelse two-groups [
    ifelse discrimination [
      let chosen-location first first first decisions-with-profits
      let chosen-wageF item 1 first first decisions-with-profits
      let chosen-wageM item 2 first first decisions-with-profits
      report [ ->
        ask comp [
          ;;pen-down
          move-to chosen-location
          ;;pen-up
          set wageF chosen-wageF
          set wageM chosen-wageM
          set wageF-change (wageF - last-wageF)
          set wageM-change (wageM - last-wageM)
          ]]

    ][
      let chosen-location first first first decisions-with-profits
      let chosen-wage item 1 first first decisions-with-profits
      report [ ->
        ask comp [
          ;;pen-down
          move-to chosen-location
         ;; pen-up
          set wageF chosen-wage
          set wageM chosen-wage
          set wageF-change (wageF - last-wageF)
          set wageM-change wageF-change
          ]]
  ]][
    let chosen-location first first first decisions-with-profits
    let chosen-wageM item 1 first first decisions-with-profits
    report [ ->
      ask comp [
       ;;pen-down
        move-to chosen-location
       ;; pen-up
        set wageM chosen-wageM
        set wageM-change (wageM - last-wageM)
        ]]
  ]
end

to-report profit-if-made-decision [decision]
  let moved 0
  ifelse two-groups [
    ifelse discrimination [

      let current-position patch-here
      let current-wageF wageF
      let current-wageM wageM
      move-to item 0 decision
      if patch-here != current-position [
        set moved 1]
      set wageF item 1 decision
      set wageM item 2 decision
      let profit-if-decided potential-profit moved
      move-to current-position
      set wageF current-wageF
      set wageM current-wageM
      report profit-if-decided]
    [
      let current-position patch-here
      let current-wage wageM
      move-to item 0 decision
      if patch-here != current-position [
        set moved 1]
      set wageF item 1 decision
      set wageM item 1 decision
      let profit-if-decided potential-profit moved
      move-to current-position
      set wageF current-wage
      set wageM current-wage
      report profit-if-decided
  ]][
    let current-position patch-here
    let current-wageM wageM
    move-to item 0 decision
    if patch-here != current-position [
      set moved 1]
    set wageM item 1 decision
    let profit-if-decided potential-profit moved
    move-to current-position
    set wageM current-wageM
    report profit-if-decided
  ]

end

to-report min-dist [comp]
  report min [distance myself] of comp
end

to-report new-location-task

  let possible-moves (list)
  ifelse random-float 1 < 0.5 [
    set possible-moves (list patch-here) ] [
    set possible-moves [ self ] of neighbors4 with [ member? self market and not any? companies-here ]
    ifelse count companies-on patch-here > 1 [
      if random-float 1 < 0.8 [
        set possible-moves fput patch-here possible-moves ]] [
      set possible-moves fput patch-here possible-moves]
    let n-comp companies with [distance myself = 1]
    if any? n-comp [
      let jumps [self] of patches with [member? self market and (min-dist n-comp) = 1 and not (member? self possible-moves)]
      if length jumps > 0 [
        let k 0
        while [ k < length jumps] [
          set possible-moves lput item k jumps possible-moves
          set k (k + 1) ]]] ;]

    if random-float 1 < 1 [
      let u min-one-of market [sum-income-here]
      let dis [patch-comp-dist] of u
      let potentials market with [not (member? self possible-moves) and patch-comp-dist >= 0.20 * dis]
      set possible-moves lput (one-of potentials) possible-moves
  ]]

let moves-with-profits
sort-by [ [a b] -> last a > last b ]
map [ move -> list move (profit-if-move-to move) ] possible-moves

let chosen-location first first moves-with-profits

let comp self
report [ ->
  ask comp [
    move-to chosen-location

]]

end

to-report profit-if-move-to [ destination ] ; turtle procedure
  let moved 0
  let current-position patch-here
  move-to destination
  if patch-here != current-position [
    set moved 1]
  let profit-at-destination potential-profit moved
  move-to current-position
  report profit-at-destination
end

to-report potential-profit [num]
  ifelse not worker-reservation [
    ifelse two-groups [
      let potential-area-countM count workers with [gender = 0 and ((preferred-company = myself and (pincome myself) > competetive-income) or (preferred-company != myself and (pincome myself) > realised-income))] + 0.5 * count workers with [gender = 0 and ((preferred-company = myself and (pincome myself) = competetive-income) or (preferred-company != myself and (pincome myself) = realised-income))]
      let potential-area-countF count workers with [gender = 1 and ((preferred-company = myself and (pincome myself) > competetive-income) or (preferred-company != myself and (pincome myself) > realised-income))] + 0.5 * count workers with [gender = 1 and ((preferred-company = myself and (pincome myself) = competetive-income) or (preferred-company != myself and (pincome myself) = realised-income))]
      report (price - wageF) * potential-area-countF + (price - wageM) * potential-area-countM - fix-cost - (max (list 0 (num * cost-of-relocation)))]
    [
      let potential-area-countM count workers with [gender = 0 and ((preferred-company = myself and (pincome myself) > competetive-income) or (preferred-company != myself and (pincome myself) > realised-income))] + 0.5 * count workers with [gender = 0 and ((preferred-company = myself and (pincome myself) = competetive-income) or (preferred-company != myself and (pincome myself) = realised-income))]
      report (price - wageM) * potential-area-countM - fix-cost - (max (list 0 (num * cost-of-relocation)))]]
  [
    ifelse two-groups [
      let potential-area-countM count workers with [gender = 0 and ((preferred-company = myself and (pincome myself) > competetive-income) or (preferred-company != myself and (pincome myself) > max (list 0 realised-income)))] + 0.5 * count workers with [gender = 0 and ((preferred-company = myself and (pincome myself) = competetive-income) or (preferred-company != myself and (pincome myself) = max (list 0 realised-income)))]
      let potential-area-countF count workers with [gender = 1 and ((preferred-company = myself and (pincome myself) > competetive-income) or (preferred-company != myself and (pincome myself) > max (list 0 realised-income)))] + 0.5 * count workers with [gender = 1 and ((preferred-company = myself and (pincome myself) = competetive-income) or (preferred-company != myself and (pincome myself) = max (list 0 realised-income)))]
      report (price - wageF) * potential-area-countF + (price - wageM) * potential-area-countM - fix-cost - (max (list 0 (num * cost-of-relocation)))]
    [
      let potential-area-countM count workers with [gender = 0 and ((preferred-company = myself and (pincome myself) > competetive-income) or (preferred-company != myself and (pincome myself) > max (list 0 realised-income)))] + 0.5 * count workers with [gender = 0 and ((preferred-company = myself and (pincome myself) = competetive-income) or (preferred-company != myself and (pincome myself) = max (list 0 realised-income)))]
      report (price - wageM) * potential-area-countM - fix-cost - (max (list 0 (num * cost-of-relocation)))]]
end

to-report new-wage-task
  let last-wageM wageM
  let last-wageF wageF
  ifelse two-groups [
    ifelse discrimination [
      let possible-wagesM fput (max (list 0 (wageM))) shuffle (list (max (list 0 (wageM - wage-surplusM))) (max (list 0 (wageM + wage-deficitM))) (max (list 0 (wageM + cutting-wageM))))
      let possible-wagesF fput (max (list 0 (wageF))) shuffle (list (max (list 0 (wageF - wage-surplusF))) (max (list 0 (wageF + wage-deficitF))) (max (list 0 (wageF + cutting-wageF))))

      let wagesM-with-revenues sort-by [ [a b] -> last a > last b ] map [ the-wageM -> list the-wageM (potential-profitM the-wageM) ] possible-wagesM
      let wagesF-with-revenues sort-by [ [a b] -> last a > last b ] map [ the-wageF -> list the-wageF (potential-profitF the-wageF) ] possible-wagesF

     ;; let all-zerosM? (not member? false map [ pair -> last pair = 0 ] wagesM-with-revenues)
     ;; let all-zerosF? (not member? false map [ pair -> last pair = 0 ] wagesF-with-revenues)

    ;;  let chosen-wageM ifelse-value all-zerosM? [ wageM + wage-deficitM ] [ first first wagesM-with-revenues ]
    ;;  let chosen-wageF ifelse-value all-zerosF? [ wageF + wage-deficitF ] [ first first wagesF-with-revenues ]

      let chosen-wageM first first wagesM-with-revenues
      let chosen-wageF first first wagesF-with-revenues

      let comp self ; put self in a local variable so that it can be "captured" by the task

      report [ ->
        ask comp [
          set wageF chosen-wageF
          set wageM chosen-wageM
          set wageF-change (wageF - last-wageF)
          set wageM-change (wageM - last-wageM)
        ]
      ]

    ] [
      let possible-wages fput (max (list 0 (wageM))) shuffle (list (max (list 0 (wageM - wage-surplus))) (max (list 0 (wageM + wage-deficit))) (max (list 0 (wageM + cutting-wage))))

      let wages-with-revenues sort-by [ [a b] -> last a > last b ] map [ the-wage -> list the-wage (potential-profitFM the-wage) ] possible-wages

     ;; let all-zeros? (not member? false map [ pair -> last pair = 0 ] wages-with-revenues)

     ;; let chosen-wage ifelse-value all-zeros? [ wageM + wage-deficit ] [ first first wages-with-revenues ]

      let chosen-wage first first wages-with-revenues

      let comp self

      report [ ->
        ask comp [
          set wageF chosen-wage
          set wageM chosen-wage
          set wageM-change (wageM - last-wageM)
          set wageF-change wageM-change
        ]
      ]

  ]][
    let possible-wagesM fput (max (list 0 (wageM))) shuffle (list (max (list 0 (wageM - wage-surplusM))) (max (list 0 (wageM + wage-deficitM))) (max (list 0 (wageM + cutting-wageM))))

    let wagesM-with-revenues sort-by [ [a b] -> last a > last b ] map [ the-wageM -> list the-wageM (potential-profitM the-wageM) ] possible-wagesM

   ;; let all-zerosM? (not member? false map [ pair -> last pair = 0 ] wagesM-with-revenues)

   ;; let chosen-wageM ifelse-value all-zerosM? [ wageM + wage-deficitM ] [ first first wagesM-with-revenues ]

    let chosen-wageM first first wagesM-with-revenues

    let comp self

    report [ ->
      ask comp [
        set wageM chosen-wageM
        set wageM-change (wageM - last-wageM)
      ]
    ]
  ]

end



to-report potential-profitF [target-wageF]
  let current-wageF wageF
  set wageF target-wageF
  let potential-area-countF 0
  ifelse not worker-reservation [
    set potential-area-countF count workers with [gender = 1 and ((preferred-company = myself and (pincome myself) > competetive-income) or (preferred-company != myself and (pincome myself) > realised-income))] + 0.5 * count workers with [gender = 1 and ((preferred-company = myself and (pincome myself) = competetive-income) or (preferred-company != myself and (pincome myself) = realised-income))]] [
    set potential-area-countF count workers with [gender = 1 and ((preferred-company = myself and (pincome myself) > competetive-income) or (preferred-company != myself and (pincome myself) > max (list 0 realised-income)))] + 0.5 * count workers with [gender = 1 and ((preferred-company = myself and (pincome myself) = competetive-income) or (preferred-company != myself and (pincome myself) = max (list 0 realised-income))) ]]
  let new-profitF (price - wageF) * potential-area-countF
  set wageF current-wageF
  report new-profitF
end

to-report potential-profitM [target-wageM]
  let current-wageM wageM
  set wageM target-wageM
  let potential-area-countM 0
  ifelse not worker-reservation [
    set potential-area-countM count workers with [gender = 0 and ((preferred-company = myself and (pincome myself) > competetive-income) or (preferred-company != myself and (pincome myself) > realised-income))] + 0.5 * count workers with [gender = 0 and ((preferred-company = myself and (pincome myself) = competetive-income) or (preferred-company != myself and (pincome myself) = realised-income))]] [
    set potential-area-countM count workers with [gender = 0 and ((preferred-company = myself and (pincome myself) > competetive-income) or (preferred-company != myself and (pincome myself) > max (list 0 realised-income)))] + 0.5 * count workers with [gender = 0 and ((preferred-company = myself and (pincome myself) = competetive-income) or (preferred-company != myself and (pincome myself) = max (list 0 realised-income))) ]]
  let new-profitM (price - wageM) * potential-area-countM
  set wageM current-wageM
  report new-profitM
end

to-report potential-profitFM [target-wage]
  let current-wage wageM
  set wageM target-wage
  set wageF target-wage
  let potential-area-countF 0
  let potential-area-countM 0
  ifelse not worker-reservation [
    set potential-area-countM count workers with [gender = 0 and ((preferred-company = myself and (pincome myself) > competetive-income) or (preferred-company != myself and (pincome myself) > realised-income))] + 0.5 * count workers with [gender = 0 and ((preferred-company = myself and (pincome myself) = competetive-income) or (preferred-company != myself and (pincome myself) = realised-income))]
    set potential-area-countF count workers with [gender = 1 and ((preferred-company = myself and (pincome myself) > competetive-income) or (preferred-company != myself and (pincome myself) > realised-income))] + 0.5 * count workers with [gender = 1 and ((preferred-company = myself and (pincome myself) = competetive-income) or (preferred-company != myself and (pincome myself) = realised-income))]][
    set potential-area-countM count workers with [gender = 0 and ((preferred-company = myself and (pincome myself) > competetive-income) or (preferred-company != myself and (pincome myself) > max (list 0 realised-income)))] + 0.5 * count workers with [gender = 0 and ((preferred-company = myself and (pincome myself) = competetive-income) or (preferred-company != myself and (pincome myself) = max (list 0 realised-income))) ]
    set potential-area-countF count workers with [gender = 1 and ((preferred-company = myself and (pincome myself) > competetive-income) or (preferred-company != myself and (pincome myself) > max (list 0 realised-income)))] + 0.5 * count workers with [gender = 1 and ((preferred-company = myself and (pincome myself) = competetive-income) or (preferred-company != myself and (pincome myself) = max (list 0 realised-income))) ]]
  let new-profit (price - wageM) * potential-area-countM + (price - wageF) * potential-area-countF - fix-cost
  set wageM current-wage
  set wageF current-wage
  report new-profit
end

to-report wage-deficitM
  let next-empM nobody
  let pot-employeesM (workers with [preferred-company != myself and gender = 0])
  ifelse any? pot-employeesM [
    let him1 min-one-of pot-employeesM [deficit myself]
    let him2 max-one-of pot-employeesM with [distance him1 < 2] [deficit myself]
    let level [deficit myself] of him2
    set next-empM one-of pot-employeesM with [ deficit myself <= level ]
    let def ceiling [deficit myself] of next-empM
    ifelse def < 1 [ ;; Akkor történik, ha két vállalat egy helyen van, és ugyanaz a bérük, ekkor esetleg emelik a bért.
      report round random-float 1 ][
      report def
  ]] [
    report -1
  ]
end

to-report wage-deficitF
  let next-empF nobody
  let pot-employeesF (workers with [preferred-company != myself and gender = 1])
  ifelse any? pot-employeesF [
    let her1 min-one-of pot-employeesF [deficit myself]
    let her2 max-one-of pot-employeesF with [distance her1 < 2] [deficit myself]
    let level [deficit myself] of her2
    set next-empF one-of pot-employeesF with [ deficit myself <= level ]
    let def ceiling [deficit myself] of next-empF
    ifelse def < 1 [ ;; Akkor történik, ha két vállalat egy helyen van, és ugyanaz a bérük, ekkor esetleg emelik a bért.
      report round random-float 1 ][
      report def
  ]] [
    report -1
  ]
end

to-report wage-deficit
  let next-emp nobody
  let pot-employees (workers with [preferred-company != myself])
  ifelse any? pot-employees [
    let them1 min-one-of pot-employees [deficit myself]
    let them2 max-one-of pot-employees with [distance them1 < 2] [deficit myself]
    let level [deficit myself] of them2
    set next-emp one-of pot-employees with [ deficit myself <= level ]
    let def ceiling [deficit myself] of next-emp
    ifelse def < 1 [ ;; Akkor történik, ha két vállalat egy helyen van, és ugyanaz a bérük, ekkor esetleg emelik a bért.
      report round random-float 1 ][
      report def
  ]] [
    report -1
  ]
end

to-report wage-surplusM
  let last-empM nobody
  let my-employeesM (workers with [preferred-company = myself and gender = 0]) ;; Last part is to not check unimportant employees
  ifelse any? my-employeesM [
    let him1 min-one-of my-employeesM [surplus]
    let him2 min-one-of my-employeesM with [distance him1 < 2] [distance myself]
    let level [surplus] of him2
    set last-empM one-of my-employeesM with [ surplus <= level]
    let sur floor [surplus] of last-empM
    ifelse sur < 1 [ report round random-float 1 ] [
      report sur + round random-float 1
  ]] [
    report 1
  ]
end

to-report wage-surplusF
  let last-empF nobody
  let my-employeesF (workers with [preferred-company = myself and gender = 1])
  ifelse any? my-employeesF [
    let her1 min-one-of my-employeesF [surplus]
    let her2 min-one-of my-employeesF with [distance her1 < 2] [distance myself]
    let level [surplus] of her2
    set last-empF one-of my-employeesF with [ surplus <= level]
    let sur floor [surplus] of last-empF
    ifelse sur < 1 [ report round random-float 1 ] [
      report sur + round random-float 1
  ]] [
    report 1
  ]
end

to-report wage-surplus
  let last-emp nobody
  let my-employees (workers with [preferred-company = myself])
  ifelse any? my-employees [
    let them1 min-one-of my-employees [surplus]
    let them2 min-one-of my-employees with [distance them1 < 2] [distance myself]
    let level [surplus] of them2
    set last-emp one-of my-employees with [ surplus <= level]
    let sur floor [surplus] of last-emp
    ifelse sur < 1 [ report round random-float 1 ] [
      report sur + round random-float 1
  ]] [
    report 1
  ]
end

to-report deficit [ a-company ] ;; csak akkor szabad meghívni, ha a munkás preferált vállalata nem a-company, worker procedure
    report (max (list 0 realised-income) - pincome a-company)
end

to-report surplus ;; worker procedure, csak akkor használom ha nekem dolgozik a munkás
    report ((realised-income) - competetive-income)
end

to-report distance-from-company [comp] ;;worker-procedure
  report distance comp
end

to-report cutting-wage ;;company-procedure
  let emp nobody
  let group workers with [distance-from-company one-of other companies = 1 and preferred-company != myself]
  ifelse any? group [
    set emp max-one-of group [distance myself]
    let def ceiling [deficit myself] of emp
    ifelse def < 1 [ ;; Akkor történik, ha két vállalat egy helyen van, és ugyanaz a bérük, ekkor esetleg emelik a bért.
      report round random-float 1 ][
      report def]] [
    report 0]
end

to-report cutting-wageM
  let emp nobody
  let group workers with [gender = 0 and (distance-from-company one-of other companies) = 1 and preferred-company != myself]
  ifelse any? group [
    set emp max-one-of group [distance myself]
    let def ceiling [deficit myself] of emp
    ifelse def < 1 [ ;; Akkor történik, ha két vállalat egy helyen van, és ugyanaz a bérük, ekkor esetleg emelik a bért.
      report round random-float 1 ][
      report def]] [
    report 0]
end

to-report cutting-wageF
  let emp nobody
  let group workers with [gender = 1 and distance-from-company one-of other companies = 1 and preferred-company != myself]
  ifelse any? group [
    set emp max-one-of group [distance myself]
    let def ceiling [deficit myself] of emp
    ifelse def < 1 [ ;; Akkor történik, ha két vállalat egy helyen van, és ugyanaz a bérük, ekkor esetleg emelik a bért.
      report round random-float 1 ][
      report def]] [
    report 0]
end

;;MONITOR REPORTERS;;

to-report profit-m
report map [ firm ->  [profit] of firm ] sort-on [who] companies
end

to-report ra-profit-m
report map [ firm ->  [ra-profit] of firm ] sort-on [who] companies
end

to-report wageM-m
report map [ firm ->  [wageM] of firm ] sort-on [who] companies
end

to-report ra-wageM-m
report map [ firm ->  [ra-wageM] of firm ] sort-on [who] companies
end

to-report location-m
  report map [ firm ->  [(list xcor ycor)] of firm ] sort-on [who] companies
end


to-report d-wageM-m
  report map [ firm ->  [wageM-change] of firm ] sort-on [who] companies
end


to-report d-location-m
  report map [ firm ->  [last-dist] of firm ] sort-on [who] companies
end


to-report d-profit-m
  report map [ firm ->  [profit-change] of firm ] sort-on [who] companies
end


to-report Mcount-m
  report map [ firm ->  [area-countM] of firm ] sort-on [who] companies
end


to-report Fcount-m
  report map [ firm ->  [area-countF] of firm ] sort-on [who] companies
end

to-report ra-Mcount-m
  report map [ firm ->  [ra-area-countM] of firm ] sort-on [who] companies
end


to-report ra-Fcount-m
  report map [ firm ->  [ra-area-countF] of firm ] sort-on [who] companies
end


to-report emp-count-m
  report map [ firm ->  [num-of-employees] of firm ] sort-on [who] companies
end


to-report wageF-m
  report map [ firm ->  [wageF] of firm ] sort-on [who] companies
end

to-report ra-wageF-m
  report map [ firm ->  [ra-wageF] of firm ] sort-on [who] companies
end

to-report d-wageF-m
  report map [ firm ->  [wageF-change] of firm ] sort-on [who] companies
end


to-report wage-ratioMF-m
  report map [ firm ->  [wage-ratioMF] of firm ] sort-on [who] companies
end

to-report ra-wage-ratioMF-m
  report map [ firm ->  [ra-wage-ratioMF] of firm ] sort-on [who] companies
end


to-report wage-gapMF-m
  report map [ firm ->  [wage-gapMF] of firm ] sort-on [who] companies
end

to-report dist-closest-m
  report map [ firm -> [item 0 comp-dist-vek] of firm ] sort-on [who] companies
end

to-report mean-comp-wage-m
  report map [ firm ->  [mean-comp-wage] of firm ] sort-on [who] companies
end

to-report d-mean-comp-wage-m
  report map [ firm ->  [mean-comp-wage-change] of firm ] sort-on [who] companies
end

to-report eff-m
  report map [ firm ->  [eff] of firm ] sort-on [who] companies
end

to-report emp-ratioMF-m
  report map [ firm ->  [area-countM / max (list 0.001 area-countF)] of firm ] sort-on [who] companies
end

to-report ra-worker-ratioMF-m
  report map [ firm ->  [ra-worker-ratioMF] of firm ] sort-on [who] companies
end

to-report ra-emp-totratM-m
  report map [ firm ->  [ra-area-countM / tot-employmentM] of firm ] sort-on [who] companies
end

to-report ra-emp-totratF-m
  report map [ firm ->  [ra-area-countF / tot-employmentF] of firm ] sort-on [who] companies
end

to-report d-wM-m
  report map [ firm ->  [d-wM] of firm ] sort-on [who] companies
end

to-report d-wF-m
  report map [ firm ->  [d-wF] of firm ] sort-on [who] companies
end

to-report dot-m
  report map [ firm ->  [didtance-over-time] of firm ] sort-on [who] companies
end

to-report close-m
  report map [ firm ->  [closest-mean] of firm ] sort-on [who] companies
end

to-report far-m
  report map [ firm ->  [farthest-mean] of firm ] sort-on [who] companies
end
@#$#@#$#@
GRAPHICS-WINDOW
389
69
797
478
-1
-1
9.76
1
10
1
1
1
0
0
0
1
-20
20
-20
20
0
0
1
ticks
30.0

BUTTON
401
12
465
45
Setup
Setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
477
14
540
47
Go
Go\n
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
0

BUTTON
552
15
629
48
Go once
Go
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
0

SLIDER
179
136
340
169
Number-of-companies
Number-of-companies
1
7
2.0
1
1
NIL
HORIZONTAL

CHOOSER
8
70
169
115
Market-shape
Market-shape
"Line" "Circle" "Square"
0

SLIDER
9
182
170
215
travel-cost-F
travel-cost-F
0
10
1.2
0.1
1
NIL
HORIZONTAL

SLIDER
9
227
170
260
travel-cost-M
travel-cost-M
0
5
0.5
0.1
1
NIL
HORIZONTAL

CHOOSER
7
16
168
61
distance-calculation
distance-calculation
"Linear" "Squared" "Heterogenous"
0

CHOOSER
8
125
169
170
rules
rules
"pricing-only" "moving-only" "both"
0

SLIDER
179
183
340
216
reservation-wage
reservation-wage
0
1000
0.0
1
1
NIL
HORIZONTAL

SLIDER
180
227
341
260
starting-wageF
starting-wageF
0
1000
160.0
1
1
NIL
HORIZONTAL

SLIDER
181
271
342
304
starting-wageM
starting-wageM
0
1000
160.0
1
1
NIL
HORIZONTAL

PLOT
1225
15
1623
362
Profitok mozgóátlagai
NIL
NIL
0.0
10.0
0.0
10.0
true
false
"ask companies [\n  create-temporary-plot-pen (word who)\n  set-plot-pen-color color ]" "ask companies [\n  create-temporary-plot-pen (word who)\n  set-plot-pen-color color \n  set-current-plot-pen (word who)\n  plot (ra-profit)]"
PENS

SLIDER
10
271
171
304
base-market-price
base-market-price
0
2000
200.0
1
1
NIL
HORIZONTAL

SWITCH
10
358
170
391
two-groups
two-groups
0
1
-1000

SWITCH
10
401
169
434
discrimination
discrimination
0
1
-1000

SWITCH
181
358
342
391
worker-reservation
worker-reservation
1
1
-1000

CHOOSER
177
16
338
61
Starting-locations
Starting-locations
"Middle" "Edges-1D" "Circle-2D" "Circle-max-2D" "Random" "Equilibrium-no-pricing-1D" "Socially-optimal-1D" "a-b-1" "a-b-2" "a-b-3" "a-b-4" "a-b-5" "a-b-6" "a-b-7" "a-b-8" "a-b-9" "a-b-10" "a-b-11" "a-b-12" "a-b-13" "a-b-14" "a-b-15" "a-b-16" "a-b-17" "a-b-18" "a-b-19" "a-b-20" "a-b-21" "a-b-22" "a-b-23" "a-b-24" "a-b-25" "close-up-1" "close-up-2" "close-up-3" "close-up-4" "sim-3-1" "sim-3-2" "sim-3-3" "sim-3-4" "sim-3-5" "sim-5-1" "sim-5-2" "sim-5-3" "sim-5-4" "sim-5-5" "mm-1" "mm-2" "mm-3" "mm-4" "mm-5" "mm-6" "mm-7" "mm-8" "mm-9" "mm-10" "mm-11" "mm-12" "mm-13" "mm-14" "mm-15" "mm-16" "mm-17" "mm-18" "mm-19" "mm-20" "mm-21" "mm-22" "mm-23" "mm-24" "mm-25" "sbs-1" "sbs-2" "sbs-3" "sbs-4" "sbs-5" "sbs-6" "sbs-7" "sbs-8" "sbs-9" "sbs-10" "sbs-11" "sbs-12" "sbs-13" "sbs-14" "sbs-15" "sbs-16" "sbs-17" "sbs-18" "sbs-19" "sbs-20"
1

SWITCH
180
401
341
434
efficiency
efficiency
1
1
-1000

SLIDER
181
315
342
348
number-of-efficient-companies
number-of-efficient-companies
0
7
1.0
1
1
NIL
HORIZONTAL

SLIDER
10
315
171
348
efficiency-factor
efficiency-factor
0
3
1.0
0.1
1
NIL
HORIZONTAL

CHOOSER
178
70
339
115
Distribution
Distribution
"uniform" "half-half" "dense-circle" "dense-square"
0

SWITCH
181
446
342
479
first/last-eff
first/last-eff
1
1
-1000

SWITCH
10
446
169
479
worker-perturbation
worker-perturbation
1
1
-1000

PLOT
827
15
1212
362
Férfi bérek mozgóátlagai
NIL
NIL
0.0
10.0
0.0
10.0
true
false
"ask companies [\n  create-temporary-plot-pen (word who)\n  set-plot-pen-color color ]" "ask companies [\n  create-temporary-plot-pen (word who)\n  set-plot-pen-color color \n  set-current-plot-pen (word who)\n  plot (ra-wageM)]"
PENS

PLOT
827
368
1212
705
Női bérek mozgóátlagai
NIL
NIL
0.0
10.0
0.0
10.0
true
false
"ask companies [\n  create-temporary-plot-pen (word who)\n  set-plot-pen-color color ]" "ask companies [\n  create-temporary-plot-pen (word who)\n  set-plot-pen-color color \n  set-current-plot-pen (word who)\n  plot (ra-wageF)]"
PENS

PLOT
1226
367
1624
704
Bérarányok mozgóátlagai
NIL
NIL
0.0
10.0
0.0
2.0
true
false
"ask companies [\n  create-temporary-plot-pen (word who)\n  set-plot-pen-color color ]" "ask companies [\n  create-temporary-plot-pen (word who)\n  set-plot-pen-color color \n  set-current-plot-pen (word who)\n  plot (ra-wage-ratioMF)]"
PENS
"pen-0" 1.0 0 -16777216 true "" "plot 1"

@#$#@#$#@
## WHAT IS IT?

(a general understanding of what the model is trying to show or explain)

## HOW IT WORKS

(what rules the agents use to create the overall behavior of the model)

## HOW TO USE IT

(how to use the model, including a description of each of the items in the Interface tab)

## THINGS TO NOTICE

(suggested things for the user to notice while running the model)

## THINGS TO TRY

(suggested things for the user to try to do (move sliders, switches, etc.) with the model)

## EXTENDING THE MODEL

(suggested things to add or change in the Code tab to make the model more complicated, detailed, accurate, etc.)

## NETLOGO FEATURES

(interesting or unusual features of NetLogo that the model uses, particularly in the Code tab; or where workarounds were needed for missing features)

## RELATED MODELS

(models in the NetLogo Models Library and elsewhere which are of related interest)

## CREDITS AND REFERENCES

(a reference to the model's URL on the web if it has one, as well as any other necessary credits, citations, and links)
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.2.1
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
<experiments>
  <experiment name="Hotelling" repetitions="10" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="2000"/>
    <exitCondition>ticks &gt; 250 and item 0 d-wF-m &lt; 0.1 and item 1 d-wF-m &lt; 0.1 and item 0 d-wM-m &lt; 0.1 and item 1 d-wM-m &lt; 0.1</exitCondition>
    <metric>[ra-profit] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-profit] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 1 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 0 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 1 (sort-on [who] companies))</metric>
    <enumeratedValueSet variable="rules">
      <value value="&quot;pricing-only&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-calculation">
      <value value="&quot;Linear&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Market-shape">
      <value value="&quot;Line&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Starting-locations">
      <value value="&quot;Edges-1D&quot;"/>
      <value value="&quot;Middle&quot;"/>
      <value value="&quot;Socially-optimal-1D&quot;"/>
      <value value="&quot;Random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distribution">
      <value value="&quot;uniform&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="two-groups">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="discrimination">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-reservation">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-perturbation">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="base-market-price">
      <value value="150"/>
      <value value="300"/>
      <value value="500"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-of-companies">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="reservation-wage">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-M">
      <value value="1"/>
      <value value="2"/>
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-F">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageM">
      <value value="100"/>
      <value value="200"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageF">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency-factor">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-of-efficient-companies">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="first/last-eff">
      <value value="false"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="d'Aspremont" repetitions="10" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="3000"/>
    <exitCondition>ticks &gt; 700 and item 0 d-wF-m &lt; 0.20 and item 1 d-wF-m &lt; 0.2 and item 0 d-wM-m &lt; 0.2 and item 1 d-wM-m &lt; 0.2</exitCondition>
    <metric>[ra-profit] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-profit] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 1 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 0 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 1 (sort-on [who] companies))</metric>
    <enumeratedValueSet variable="rules">
      <value value="&quot;pricing-only&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-calculation">
      <value value="&quot;Squared&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Market-shape">
      <value value="&quot;Line&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Starting-locations">
      <value value="&quot;Edges-1D&quot;"/>
      <value value="&quot;Middle&quot;"/>
      <value value="&quot;Socially-optimal-1D&quot;"/>
      <value value="&quot;Random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distribution">
      <value value="&quot;uniform&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="two-groups">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="discrimination">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-reservation">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-perturbation">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="base-market-price">
      <value value="500"/>
      <value value="800"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-of-companies">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="reservation-wage">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-M">
      <value value="0.2"/>
      <value value="0.3"/>
      <value value="0.4"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-F">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageM">
      <value value="150"/>
      <value value="500"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageF">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency-factor">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-of-efficient-companies">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="first/last-eff">
      <value value="false"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Lerner-Singer-Smithies" repetitions="10" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="2000"/>
    <exitCondition>ticks &gt; 250 and item 0 d-wF-m &lt; 0.1 and item 1 d-wF-m &lt; 0.1 and item 0 d-wM-m &lt; 0.1 and item 1 d-wM-m &lt; 0.1 and (max dot-m) &lt; 2</exitCondition>
    <metric>[ra-profit] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-profit] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 1 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 0 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 1 (sort-on [who] companies))</metric>
    <enumeratedValueSet variable="rules">
      <value value="&quot;both&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-calculation">
      <value value="&quot;Linear&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Market-shape">
      <value value="&quot;Line&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Starting-locations">
      <value value="&quot;Random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distribution">
      <value value="&quot;uniform&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="two-groups">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="discrimination">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-reservation">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-perturbation">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="base-market-price">
      <value value="150"/>
      <value value="200"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-of-companies">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="reservation-wage">
      <value value="75"/>
      <value value="110"/>
      <value value="130"/>
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-M">
      <value value="1"/>
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-F">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageM">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageF">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency-factor">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-of-efficient-companies">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="first/last-eff">
      <value value="false"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Eaton-Lipsey-line" repetitions="10" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="2000"/>
    <exitCondition>ticks &gt; 250 and (max dot-m) &lt; 1</exitCondition>
    <metric>[ra-profit] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-profit] of (item 1 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 0 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 1 (sort-on [who] companies))</metric>
    <enumeratedValueSet variable="rules">
      <value value="&quot;moving-only&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-calculation">
      <value value="&quot;Linear&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Market-shape">
      <value value="&quot;Line&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Starting-locations">
      <value value="&quot;Socially-optimal-1D&quot;"/>
      <value value="&quot;Random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distribution">
      <value value="&quot;uniform&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="two-groups">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="discrimination">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-reservation">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-perturbation">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="base-market-price">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-of-companies">
      <value value="2"/>
      <value value="3"/>
      <value value="4"/>
      <value value="5"/>
      <value value="6"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="reservation-wage">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-M">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-F">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageM">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageF">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency-factor">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-of-efficient-companies">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="first/last-eff">
      <value value="false"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Eaton-Lipsey-square" repetitions="10" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="2000"/>
    <exitCondition>ticks &gt; 250 and (max dot-m) &lt; 1</exitCondition>
    <metric>[ra-profit] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-profit] of (item 1 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 0 (sort-on [who] companies))</metric>
    <metric>[pycor] of (item 0 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 1 (sort-on [who] companies))</metric>
    <metric>[pycor] of (item 1 (sort-on [who] companies))</metric>
    <enumeratedValueSet variable="rules">
      <value value="&quot;moving-only&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-calculation">
      <value value="&quot;Linear&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Market-shape">
      <value value="&quot;Square&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Starting-locations">
      <value value="&quot;Circle-2D&quot;"/>
      <value value="&quot;Random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distribution">
      <value value="&quot;uniform&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="two-groups">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="discrimination">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-reservation">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-perturbation">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="base-market-price">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-of-companies">
      <value value="2"/>
      <value value="3"/>
      <value value="4"/>
      <value value="5"/>
      <value value="6"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="reservation-wage">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-M">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-F">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageM">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageF">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency-factor">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-of-efficient-companies">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="first/last-eff">
      <value value="false"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Hirsch" repetitions="20" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="2000"/>
    <exitCondition>ticks &gt; 250 and item 0 d-wF-m &lt; 0.3 and item 1 d-wF-m &lt; 0.3 and item 0 d-wM-m &lt; 0.3 and item 1 d-wM-m &lt; 0.3</exitCondition>
    <metric>[ra-profit] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-profit] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wageF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wageF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wage-ratioMF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wage-ratioMF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-area-countM] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-area-countM] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-area-countF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-area-countF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-worker-ratioMF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-worker-ratioMF] of (item 1 (sort-on [who] companies))</metric>
    <enumeratedValueSet variable="rules">
      <value value="&quot;pricing-only&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-calculation">
      <value value="&quot;Linear&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Market-shape">
      <value value="&quot;Line&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Starting-locations">
      <value value="&quot;Edges-1D&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distribution">
      <value value="&quot;uniform&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="two-groups">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="discrimination">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-reservation">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-perturbation">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="base-market-price">
      <value value="200"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-of-companies">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="reservation-wage">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-M">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-F">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageM">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageF">
      <value value="100"/>
    </enumeratedValueSet>
    <steppedValueSet variable="efficiency-factor" first="1" step="0.1" last="1.8"/>
    <enumeratedValueSet variable="number-of-efficient-companies">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="first/last-eff">
      <value value="true"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="noeff" repetitions="5" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="2000"/>
    <exitCondition>ticks &gt; 250 and item 0 d-wF-m &lt; 0.2 and item 1 d-wF-m &lt; 0.2 and item 0 d-wM-m &lt; 0.2 and item 1 d-wM-m &lt; 0.2</exitCondition>
    <metric>[ra-profit] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-profit] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wageF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wageF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wage-ratioMF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wage-ratioMF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-area-countM] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-area-countM] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-area-countF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-area-countF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-worker-ratioMF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-worker-ratioMF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 0 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 1 (sort-on [who] companies))</metric>
    <enumeratedValueSet variable="rules">
      <value value="&quot;pricing-only&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-calculation">
      <value value="&quot;Linear&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Market-shape">
      <value value="&quot;Line&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Starting-locations">
      <value value="&quot;a-b-1&quot;"/>
      <value value="&quot;a-b-2&quot;"/>
      <value value="&quot;a-b-3&quot;"/>
      <value value="&quot;a-b-4&quot;"/>
      <value value="&quot;a-b-5&quot;"/>
      <value value="&quot;a-b-6&quot;"/>
      <value value="&quot;a-b-7&quot;"/>
      <value value="&quot;a-b-8&quot;"/>
      <value value="&quot;a-b-9&quot;"/>
      <value value="&quot;a-b-10&quot;"/>
      <value value="&quot;a-b-11&quot;"/>
      <value value="&quot;a-b-12&quot;"/>
      <value value="&quot;a-b-13&quot;"/>
      <value value="&quot;a-b-14&quot;"/>
      <value value="&quot;a-b-15&quot;"/>
      <value value="&quot;a-b-16&quot;"/>
      <value value="&quot;a-b-17&quot;"/>
      <value value="&quot;a-b-18&quot;"/>
      <value value="&quot;a-b-19&quot;"/>
      <value value="&quot;a-b-20&quot;"/>
      <value value="&quot;a-b-21&quot;"/>
      <value value="&quot;a-b-22&quot;"/>
      <value value="&quot;a-b-23&quot;"/>
      <value value="&quot;a-b-24&quot;"/>
      <value value="&quot;a-b-25&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distribution">
      <value value="&quot;half-half&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="two-groups">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="discrimination">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-reservation">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-perturbation">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="base-market-price">
      <value value="200"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-of-companies">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="reservation-wage">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-M">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-F">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageM">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageF">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency-factor">
      <value value="1.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-of-efficient-companies">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="first/last-eff">
      <value value="true"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="eff" repetitions="5" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="2000"/>
    <exitCondition>ticks &gt; 250 and item 0 d-wF-m &lt; 0.3 and item 1 d-wF-m &lt; 0.3 and item 0 d-wM-m &lt; 0.3 and item 1 d-wM-m &lt; 0.3</exitCondition>
    <metric>[ra-profit] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-profit] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wageF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wageF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wage-ratioMF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wage-ratioMF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-area-countM] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-area-countM] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-area-countF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-area-countF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-worker-ratioMF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-worker-ratioMF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 0 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 1 (sort-on [who] companies))</metric>
    <enumeratedValueSet variable="rules">
      <value value="&quot;pricing-only&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-calculation">
      <value value="&quot;Linear&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Market-shape">
      <value value="&quot;Line&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Starting-locations">
      <value value="&quot;a-b-1&quot;"/>
      <value value="&quot;a-b-2&quot;"/>
      <value value="&quot;a-b-3&quot;"/>
      <value value="&quot;a-b-4&quot;"/>
      <value value="&quot;a-b-5&quot;"/>
      <value value="&quot;a-b-6&quot;"/>
      <value value="&quot;a-b-7&quot;"/>
      <value value="&quot;a-b-8&quot;"/>
      <value value="&quot;a-b-9&quot;"/>
      <value value="&quot;a-b-10&quot;"/>
      <value value="&quot;a-b-11&quot;"/>
      <value value="&quot;a-b-12&quot;"/>
      <value value="&quot;a-b-13&quot;"/>
      <value value="&quot;a-b-14&quot;"/>
      <value value="&quot;a-b-15&quot;"/>
      <value value="&quot;a-b-16&quot;"/>
      <value value="&quot;a-b-17&quot;"/>
      <value value="&quot;a-b-18&quot;"/>
      <value value="&quot;a-b-19&quot;"/>
      <value value="&quot;a-b-20&quot;"/>
      <value value="&quot;a-b-21&quot;"/>
      <value value="&quot;a-b-22&quot;"/>
      <value value="&quot;a-b-23&quot;"/>
      <value value="&quot;a-b-24&quot;"/>
      <value value="&quot;a-b-25&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distribution">
      <value value="&quot;half-half&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="two-groups">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="discrimination">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-reservation">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="new-companies">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="base-market-price">
      <value value="200"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-of-companies">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="reservation-wage">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-M">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-F">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageM">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageF">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency-factor">
      <value value="1.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-of-efficient-companies">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="fix-cost-of-prod">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="first/last-eff">
      <value value="true"/>
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="cost-of-relocation">
      <value value="0"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="noeff-2D" repetitions="5" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="2000"/>
    <exitCondition>ticks &gt; 250 and item 0 d-wF-m &lt; 0.2 and item 1 d-wF-m &lt; 0.2 and item 0 d-wM-m &lt; 0.2 and item 1 d-wM-m &lt; 0.2</exitCondition>
    <metric>[ra-profit] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-profit] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wageF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wageF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wage-ratioMF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wage-ratioMF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-area-countM] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-area-countM] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-area-countF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-area-countF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-worker-ratioMF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-worker-ratioMF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 0 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 1 (sort-on [who] companies))</metric>
    <enumeratedValueSet variable="rules">
      <value value="&quot;pricing-only&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-calculation">
      <value value="&quot;Linear&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Market-shape">
      <value value="&quot;Square&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Starting-locations">
      <value value="&quot;a-b-1&quot;"/>
      <value value="&quot;a-b-2&quot;"/>
      <value value="&quot;a-b-3&quot;"/>
      <value value="&quot;a-b-4&quot;"/>
      <value value="&quot;a-b-5&quot;"/>
      <value value="&quot;a-b-6&quot;"/>
      <value value="&quot;a-b-7&quot;"/>
      <value value="&quot;a-b-8&quot;"/>
      <value value="&quot;a-b-9&quot;"/>
      <value value="&quot;a-b-10&quot;"/>
      <value value="&quot;a-b-11&quot;"/>
      <value value="&quot;a-b-12&quot;"/>
      <value value="&quot;a-b-13&quot;"/>
      <value value="&quot;a-b-14&quot;"/>
      <value value="&quot;a-b-15&quot;"/>
      <value value="&quot;a-b-16&quot;"/>
      <value value="&quot;a-b-17&quot;"/>
      <value value="&quot;a-b-18&quot;"/>
      <value value="&quot;a-b-19&quot;"/>
      <value value="&quot;a-b-20&quot;"/>
      <value value="&quot;a-b-21&quot;"/>
      <value value="&quot;a-b-22&quot;"/>
      <value value="&quot;a-b-23&quot;"/>
      <value value="&quot;a-b-24&quot;"/>
      <value value="&quot;a-b-25&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distribution">
      <value value="&quot;half-half&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="two-groups">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="discrimination">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-reservation">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-perturbation">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="base-market-price">
      <value value="200"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-of-companies">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="reservation-wage">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-M">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-F">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageM">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageF">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency-factor">
      <value value="1.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-of-efficient-companies">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="first/last-eff">
      <value value="true"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="eff-2D" repetitions="5" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="2000"/>
    <exitCondition>ticks &gt; 250 and item 0 d-wF-m &lt; 0.3 and item 1 d-wF-m &lt; 0.3 and item 0 d-wM-m &lt; 0.3 and item 1 d-wM-m &lt; 0.3</exitCondition>
    <metric>[ra-profit] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-profit] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wageF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wageF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wage-ratioMF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wage-ratioMF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-area-countM] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-area-countM] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-area-countF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-area-countF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-worker-ratioMF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-worker-ratioMF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 0 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 1 (sort-on [who] companies))</metric>
    <enumeratedValueSet variable="rules">
      <value value="&quot;pricing-only&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-calculation">
      <value value="&quot;Linear&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Market-shape">
      <value value="&quot;Square&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Starting-locations">
      <value value="&quot;a-b-1&quot;"/>
      <value value="&quot;a-b-2&quot;"/>
      <value value="&quot;a-b-3&quot;"/>
      <value value="&quot;a-b-4&quot;"/>
      <value value="&quot;a-b-5&quot;"/>
      <value value="&quot;a-b-6&quot;"/>
      <value value="&quot;a-b-7&quot;"/>
      <value value="&quot;a-b-8&quot;"/>
      <value value="&quot;a-b-9&quot;"/>
      <value value="&quot;a-b-10&quot;"/>
      <value value="&quot;a-b-11&quot;"/>
      <value value="&quot;a-b-12&quot;"/>
      <value value="&quot;a-b-13&quot;"/>
      <value value="&quot;a-b-14&quot;"/>
      <value value="&quot;a-b-15&quot;"/>
      <value value="&quot;a-b-16&quot;"/>
      <value value="&quot;a-b-17&quot;"/>
      <value value="&quot;a-b-18&quot;"/>
      <value value="&quot;a-b-19&quot;"/>
      <value value="&quot;a-b-20&quot;"/>
      <value value="&quot;a-b-21&quot;"/>
      <value value="&quot;a-b-22&quot;"/>
      <value value="&quot;a-b-23&quot;"/>
      <value value="&quot;a-b-24&quot;"/>
      <value value="&quot;a-b-25&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distribution">
      <value value="&quot;half-half&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="two-groups">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="discrimination">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-reservation">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="new-companies">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="base-market-price">
      <value value="200"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-of-companies">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="reservation-wage">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-M">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-F">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageM">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageF">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency-factor">
      <value value="1.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-of-efficient-companies">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="fix-cost-of-prod">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="first/last-eff">
      <value value="true"/>
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="cost-of-relocation">
      <value value="0"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="eff-2D-sim-3" repetitions="5" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="2000"/>
    <exitCondition>ticks &gt; 250 and item 0 d-wF-m &lt; 0.3 and item 1 d-wF-m &lt; 0.3 and item 0 d-wM-m &lt; 0.3 and item 1 d-wM-m &lt; 0.3 and item 2 d-wF-m &lt; 0.3 and item 2 d-wM-m &lt; 0.3</exitCondition>
    <metric>[ra-profit] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-profit] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-profit] of (item 2 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 2 (sort-on [who] companies))</metric>
    <metric>[ra-wageF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wageF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wageF] of (item 2 (sort-on [who] companies))</metric>
    <metric>[ra-wage-ratioMF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wage-ratioMF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wage-ratioMF] of (item 2 (sort-on [who] companies))</metric>
    <metric>[ra-area-countM] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-area-countM] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-area-countM] of (item 2 (sort-on [who] companies))</metric>
    <metric>[ra-area-countF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-area-countF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-area-countF] of (item 2 (sort-on [who] companies))</metric>
    <metric>[ra-worker-ratioMF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-worker-ratioMF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-worker-ratioMF] of (item 2 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 0 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 1 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 2 (sort-on [who] companies))</metric>
    <enumeratedValueSet variable="rules">
      <value value="&quot;pricing-only&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-calculation">
      <value value="&quot;Linear&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Market-shape">
      <value value="&quot;Square&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Starting-locations">
      <value value="&quot;sim-3-1&quot;"/>
      <value value="&quot;sim-3-2&quot;"/>
      <value value="&quot;sim-3-3&quot;"/>
      <value value="&quot;sim-3-4&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distribution">
      <value value="&quot;dense-circle&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="two-groups">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="discrimination">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-reservation">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="new-companies">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="base-market-price">
      <value value="200"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-of-companies">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="reservation-wage">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-M">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-F">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageM">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageF">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency-factor">
      <value value="1.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-of-efficient-companies">
      <value value="1"/>
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="fix-cost-of-prod">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="first/last-eff">
      <value value="true"/>
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="cost-of-relocation">
      <value value="0"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="noeff-2D-sim-5" repetitions="10" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="2000"/>
    <exitCondition>ticks &gt; 250 and item 0 d-wF-m &lt; 0.5 and item 1 d-wF-m &lt; 0.5 and item 0 d-wM-m &lt; 0.5 and item 1 d-wM-m &lt; 0.5 and item 2 d-wF-m &lt; 0.5 and item 3 d-wF-m &lt; 0.5 and item 2 d-wM-m &lt; 0.5 and item 3 d-wM-m &lt; 0.5 and item 4 d-wF-m &lt; 0.5 and item 4 d-wM-m &lt; 0.5</exitCondition>
    <metric>[ra-profit] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-profit] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wageF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wageF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wage-ratioMF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wage-ratioMF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-area-countM] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-area-countM] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-area-countF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-area-countF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-worker-ratioMF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-worker-ratioMF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 0 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 1 (sort-on [who] companies))</metric>
    <enumeratedValueSet variable="rules">
      <value value="&quot;pricing-only&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-calculation">
      <value value="&quot;Linear&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Market-shape">
      <value value="&quot;Square&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Starting-locations">
      <value value="&quot;sim-5-1&quot;"/>
      <value value="&quot;sim-5-2&quot;"/>
      <value value="&quot;sim-5-3&quot;"/>
      <value value="&quot;sim-5-4&quot;"/>
      <value value="&quot;sim-5-5&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distribution">
      <value value="&quot;dense-square&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="two-groups">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="discrimination">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-reservation">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-perturbation">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="base-market-price">
      <value value="300"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-of-companies">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="reservation-wage">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-M">
      <value value="4"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-F">
      <value value="8"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageM">
      <value value="200"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageF">
      <value value="200"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency-factor">
      <value value="1.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-of-efficient-companies">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="first/last-eff">
      <value value="true"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="noeff-2D-sim-3" repetitions="10" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="2000"/>
    <exitCondition>ticks &gt; 250 and item 0 d-wF-m &lt; 0.2 and item 1 d-wF-m &lt; 0.2 and item 0 d-wM-m &lt; 0.2 and item 1 d-wM-m &lt; 0.2 and item 2 d-wF-m &lt; 0.2 and item 2 d-wM-m &lt; 0.2</exitCondition>
    <metric>[ra-profit] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-profit] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wageF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wageF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wage-ratioMF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wage-ratioMF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-area-countM] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-area-countM] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-area-countF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-area-countF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-worker-ratioMF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-worker-ratioMF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 0 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 1 (sort-on [who] companies))</metric>
    <enumeratedValueSet variable="rules">
      <value value="&quot;pricing-only&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-calculation">
      <value value="&quot;Linear&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Market-shape">
      <value value="&quot;Square&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Starting-locations">
      <value value="&quot;sim-3-1&quot;"/>
      <value value="&quot;sim-3-2&quot;"/>
      <value value="&quot;sim-3-3&quot;"/>
      <value value="&quot;sim-3-4&quot;"/>
      <value value="&quot;sim-3-5&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distribution">
      <value value="&quot;dense-circle&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="two-groups">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="discrimination">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-reservation">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="new-companies">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="base-market-price">
      <value value="200"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-of-companies">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="reservation-wage">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-M">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-F">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageM">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageF">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency-factor">
      <value value="1.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-of-efficient-companies">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="fix-cost-of-prod">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="first/last-eff">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="cost-of-relocation">
      <value value="0"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="eff-2D-sim-5" repetitions="10" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="2000"/>
    <exitCondition>ticks &gt; 250 and item 0 d-wF-m &lt; 0.5 and item 1 d-wF-m &lt; 0.5 and item 0 d-wM-m &lt; 0.5 and item 1 d-wM-m &lt; 0.5 and item 2 d-wF-m &lt; 0.5 and item 3 d-wF-m &lt; 0.5 and item 2 d-wM-m &lt; 0.5 and item 3 d-wM-m &lt; 0.5 and item 4 d-wF-m &lt; 0.5 and item 4 d-wM-m &lt; 0.5</exitCondition>
    <metric>[ra-profit] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-profit] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wageF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wageF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wage-ratioMF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wage-ratioMF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-area-countM] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-area-countM] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-area-countF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-area-countF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-worker-ratioMF] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-worker-ratioMF] of (item 1 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 0 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 1 (sort-on [who] companies))</metric>
    <enumeratedValueSet variable="rules">
      <value value="&quot;pricing-only&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-calculation">
      <value value="&quot;Linear&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Market-shape">
      <value value="&quot;Square&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Starting-locations">
      <value value="&quot;sim-5-1&quot;"/>
      <value value="&quot;sim-5-2&quot;"/>
      <value value="&quot;sim-5-3&quot;"/>
      <value value="&quot;sim-5-4&quot;"/>
      <value value="&quot;sim-5-5&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distribution">
      <value value="&quot;dense-square&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="two-groups">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="discrimination">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-reservation">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="new-companies">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="base-market-price">
      <value value="300"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-of-companies">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="reservation-wage">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-M">
      <value value="4"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-F">
      <value value="8"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageM">
      <value value="200"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageF">
      <value value="200"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency-factor">
      <value value="1.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-of-efficient-companies">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="fix-cost-of-prod">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="first/last-eff">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="cost-of-relocation">
      <value value="0"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Tabuchi" repetitions="5" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="2000"/>
    <exitCondition>ticks &gt; 700 and item 0 d-wF-m &lt; 0.20 and item 1 d-wF-m &lt; 0.2 and item 0 d-wM-m &lt; 0.2 and item 1 d-wM-m &lt; 0.2</exitCondition>
    <metric>[ra-profit] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-profit] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 1 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 0 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 1 (sort-on [who] companies))</metric>
    <enumeratedValueSet variable="rules">
      <value value="&quot;pricing-only&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-calculation">
      <value value="&quot;Squared&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Market-shape">
      <value value="&quot;Square&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Starting-locations">
      <value value="&quot;mm-1&quot;"/>
      <value value="&quot;mm-2&quot;"/>
      <value value="&quot;mm-3&quot;"/>
      <value value="&quot;mm-4&quot;"/>
      <value value="&quot;mm-5&quot;"/>
      <value value="&quot;mm-6&quot;"/>
      <value value="&quot;mm-7&quot;"/>
      <value value="&quot;mm-8&quot;"/>
      <value value="&quot;mm-9&quot;"/>
      <value value="&quot;mm-10&quot;"/>
      <value value="&quot;mm-11&quot;"/>
      <value value="&quot;mm-12&quot;"/>
      <value value="&quot;mm-13&quot;"/>
      <value value="&quot;mm-14&quot;"/>
      <value value="&quot;mm-15&quot;"/>
      <value value="&quot;mm-16&quot;"/>
      <value value="&quot;mm-17&quot;"/>
      <value value="&quot;mm-18&quot;"/>
      <value value="&quot;mm-19&quot;"/>
      <value value="&quot;mm-20&quot;"/>
      <value value="&quot;mm-21&quot;"/>
      <value value="&quot;mm-22&quot;"/>
      <value value="&quot;mm-23&quot;"/>
      <value value="&quot;mm-24&quot;"/>
      <value value="&quot;mm-25&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distribution">
      <value value="&quot;uniform&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="two-groups">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="discrimination">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-reservation">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-perturbation">
      <value value="false"/>
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="base-market-price">
      <value value="800"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-of-companies">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="reservation-wage">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-M">
      <value value="0.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-F">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageM">
      <value value="300"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageF">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency-factor">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-of-efficient-companies">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="first/last-eff">
      <value value="false"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Wilensky" repetitions="20" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="1000"/>
    <exitCondition>ticks &gt; 700 and item 0 d-wM-m &lt; 0.2 and item 1 d-wM-m &lt; 0.2 and (max dot-m) &lt; 5</exitCondition>
    <metric>[ra-profit] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-profit] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 1 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 0 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 1 (sort-on [who] companies))</metric>
    <enumeratedValueSet variable="rules">
      <value value="&quot;both&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-calculation">
      <value value="&quot;Linear&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Market-shape">
      <value value="&quot;Square&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Starting-locations">
      <value value="&quot;Random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distribution">
      <value value="&quot;uniform&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="two-groups">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="discrimination">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-reservation">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-perturbation">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="base-market-price">
      <value value="200"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-of-companies">
      <value value="2"/>
      <value value="3"/>
      <value value="4"/>
      <value value="5"/>
      <value value="6"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="reservation-wage">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-M">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-F">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageM">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageF">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency-factor">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-of-efficient-companies">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="first/last-eff">
      <value value="false"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Tabuchi-horizontal" repetitions="5" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="2000"/>
    <exitCondition>ticks &gt; 700 and item 0 d-wF-m &lt; 0.20 and item 1 d-wF-m &lt; 0.2 and item 0 d-wM-m &lt; 0.2 and item 1 d-wM-m &lt; 0.2</exitCondition>
    <metric>[ra-profit] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-profit] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 1 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 0 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 1 (sort-on [who] companies))</metric>
    <enumeratedValueSet variable="rules">
      <value value="&quot;pricing-only&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-calculation">
      <value value="&quot;Squared&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Market-shape">
      <value value="&quot;Square&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Starting-locations">
      <value value="&quot;a-b-1&quot;"/>
      <value value="&quot;a-b-2&quot;"/>
      <value value="&quot;a-b-3&quot;"/>
      <value value="&quot;a-b-4&quot;"/>
      <value value="&quot;a-b-5&quot;"/>
      <value value="&quot;a-b-6&quot;"/>
      <value value="&quot;a-b-7&quot;"/>
      <value value="&quot;a-b-8&quot;"/>
      <value value="&quot;a-b-9&quot;"/>
      <value value="&quot;a-b-10&quot;"/>
      <value value="&quot;a-b-11&quot;"/>
      <value value="&quot;a-b-12&quot;"/>
      <value value="&quot;a-b-13&quot;"/>
      <value value="&quot;a-b-14&quot;"/>
      <value value="&quot;a-b-15&quot;"/>
      <value value="&quot;a-b-16&quot;"/>
      <value value="&quot;a-b-17&quot;"/>
      <value value="&quot;a-b-18&quot;"/>
      <value value="&quot;a-b-19&quot;"/>
      <value value="&quot;a-b-20&quot;"/>
      <value value="&quot;a-b-21&quot;"/>
      <value value="&quot;a-b-22&quot;"/>
      <value value="&quot;a-b-23&quot;"/>
      <value value="&quot;a-b-24&quot;"/>
      <value value="&quot;a-b-25&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distribution">
      <value value="&quot;uniform&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="two-groups">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="discrimination">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-reservation">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-perturbation">
      <value value="false"/>
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="base-market-price">
      <value value="800"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-of-companies">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="reservation-wage">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-M">
      <value value="0.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-F">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageM">
      <value value="300"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageF">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency-factor">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-of-efficient-companies">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="first/last-eff">
      <value value="false"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Wilensky2" repetitions="15" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="120"/>
    <exitCondition>ticks &gt; 20 and item 0 d-wM-m &lt; 0.2 and item 1 d-wM-m &lt; 0.2 and (max dot-m) &lt; 5</exitCondition>
    <metric>[ra-profit] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-profit] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-profit] of (item 2 (sort-on [who] companies))</metric>
    <metric>[ra-profit] of (item 3 (sort-on [who] companies))</metric>
    <metric>[ra-profit] of (item 4 (sort-on [who] companies))</metric>
    <metric>[ra-profit] of (item 5 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 2 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 3 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 4 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 5 (sort-on [who] companies))</metric>
    <metric>[closest-mean] of (item 0 (sort-on [who] companies))</metric>
    <metric>[closest-mean] of (item 1 (sort-on [who] companies))</metric>
    <metric>[closest-mean] of (item 2 (sort-on [who] companies))</metric>
    <metric>[closest-mean] of (item 3 (sort-on [who] companies))</metric>
    <metric>[closest-mean] of (item 4 (sort-on [who] companies))</metric>
    <metric>[closest-mean] of (item 5 (sort-on [who] companies))</metric>
    <metric>[farthest-mean] of (item 0 (sort-on [who] companies))</metric>
    <metric>[farthest-mean] of (item 1 (sort-on [who] companies))</metric>
    <metric>[farthest-mean] of (item 2 (sort-on [who] companies))</metric>
    <metric>[farthest-mean] of (item 3 (sort-on [who] companies))</metric>
    <metric>[farthest-mean] of (item 4 (sort-on [who] companies))</metric>
    <metric>[farthest-mean] of (item 5 (sort-on [who] companies))</metric>
    <enumeratedValueSet variable="rules">
      <value value="&quot;both&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-calculation">
      <value value="&quot;Linear&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Market-shape">
      <value value="&quot;Square&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Starting-locations">
      <value value="&quot;Random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distribution">
      <value value="&quot;uniform&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="two-groups">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="discrimination">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-reservation">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-perturbation">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="base-market-price">
      <value value="200"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-of-companies">
      <value value="6"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="reservation-wage">
      <value value="0"/>
    </enumeratedValueSet>
    <steppedValueSet variable="travel-cost-M" first="0.6" step="0.2" last="3"/>
    <enumeratedValueSet variable="travel-cost-F">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageM">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageF">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency-factor">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-of-efficient-companies">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="first/last-eff">
      <value value="false"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Hotelling2" repetitions="10" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="2000"/>
    <exitCondition>ticks &gt; 250 and item 0 d-wF-m &lt; 0.1 and item 1 d-wF-m &lt; 0.1 and item 0 d-wM-m &lt; 0.1 and item 1 d-wM-m &lt; 0.1</exitCondition>
    <metric>[ra-profit] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-profit] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 1 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 0 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 1 (sort-on [who] companies))</metric>
    <enumeratedValueSet variable="rules">
      <value value="&quot;pricing-only&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-calculation">
      <value value="&quot;Linear&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Market-shape">
      <value value="&quot;Line&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Starting-locations">
      <value value="&quot;a-b-1&quot;"/>
      <value value="&quot;a-b-2&quot;"/>
      <value value="&quot;a-b-3&quot;"/>
      <value value="&quot;a-b-4&quot;"/>
      <value value="&quot;a-b-5&quot;"/>
      <value value="&quot;a-b-6&quot;"/>
      <value value="&quot;a-b-7&quot;"/>
      <value value="&quot;a-b-8&quot;"/>
      <value value="&quot;a-b-9&quot;"/>
      <value value="&quot;a-b-10&quot;"/>
      <value value="&quot;a-b-11&quot;"/>
      <value value="&quot;a-b-12&quot;"/>
      <value value="&quot;a-b-13&quot;"/>
      <value value="&quot;a-b-14&quot;"/>
      <value value="&quot;a-b-15&quot;"/>
      <value value="&quot;a-b-16&quot;"/>
      <value value="&quot;a-b-17&quot;"/>
      <value value="&quot;a-b-18&quot;"/>
      <value value="&quot;a-b-19&quot;"/>
      <value value="&quot;a-b-20&quot;"/>
      <value value="&quot;a-b-21&quot;"/>
      <value value="&quot;a-b-22&quot;"/>
      <value value="&quot;a-b-23&quot;"/>
      <value value="&quot;a-b-24&quot;"/>
      <value value="&quot;a-b-25&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distribution">
      <value value="&quot;uniform&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="two-groups">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="discrimination">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-reservation">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-perturbation">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="base-market-price">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-of-companies">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="reservation-wage">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-M">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-F">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageM">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageF">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency-factor">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-of-efficient-companies">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="first/last-eff">
      <value value="false"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="d'Aspremont2" repetitions="10" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="3000"/>
    <exitCondition>ticks &gt; 700 and item 0 d-wF-m &lt; 0.20 and item 1 d-wF-m &lt; 0.2 and item 0 d-wM-m &lt; 0.2 and item 1 d-wM-m &lt; 0.2</exitCondition>
    <metric>[ra-profit] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-profit] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 1 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 0 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 1 (sort-on [who] companies))</metric>
    <enumeratedValueSet variable="rules">
      <value value="&quot;pricing-only&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-calculation">
      <value value="&quot;Squared&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Market-shape">
      <value value="&quot;Line&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Starting-locations">
      <value value="&quot;a-b-1&quot;"/>
      <value value="&quot;a-b-2&quot;"/>
      <value value="&quot;a-b-3&quot;"/>
      <value value="&quot;a-b-4&quot;"/>
      <value value="&quot;a-b-5&quot;"/>
      <value value="&quot;a-b-6&quot;"/>
      <value value="&quot;a-b-7&quot;"/>
      <value value="&quot;a-b-8&quot;"/>
      <value value="&quot;a-b-9&quot;"/>
      <value value="&quot;a-b-10&quot;"/>
      <value value="&quot;a-b-11&quot;"/>
      <value value="&quot;a-b-12&quot;"/>
      <value value="&quot;a-b-13&quot;"/>
      <value value="&quot;a-b-14&quot;"/>
      <value value="&quot;a-b-15&quot;"/>
      <value value="&quot;a-b-16&quot;"/>
      <value value="&quot;a-b-17&quot;"/>
      <value value="&quot;a-b-18&quot;"/>
      <value value="&quot;a-b-19&quot;"/>
      <value value="&quot;a-b-20&quot;"/>
      <value value="&quot;a-b-21&quot;"/>
      <value value="&quot;a-b-22&quot;"/>
      <value value="&quot;a-b-23&quot;"/>
      <value value="&quot;a-b-24&quot;"/>
      <value value="&quot;a-b-25&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distribution">
      <value value="&quot;uniform&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="two-groups">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="discrimination">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-reservation">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-perturbation">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="base-market-price">
      <value value="500"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-of-companies">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="reservation-wage">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-M">
      <value value="0.4"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-F">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageM">
      <value value="200"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageF">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency-factor">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-of-efficient-companies">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="first/last-eff">
      <value value="false"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Hotelling3" repetitions="50" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="2000"/>
    <exitCondition>ticks &gt; 250 and item 0 d-wF-m &lt; 0.2 and item 1 d-wF-m &lt; 0.2 and item 0 d-wM-m &lt; 0.2 and item 1 d-wM-m &lt; 0.2</exitCondition>
    <metric>[ra-profit] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-profit] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 1 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 0 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 1 (sort-on [who] companies))</metric>
    <enumeratedValueSet variable="rules">
      <value value="&quot;pricing-only&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-calculation">
      <value value="&quot;Linear&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Market-shape">
      <value value="&quot;Line&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Starting-locations">
      <value value="&quot;sbs-1&quot;"/>
      <value value="&quot;sbs-2&quot;"/>
      <value value="&quot;sbs-3&quot;"/>
      <value value="&quot;sbs-4&quot;"/>
      <value value="&quot;sbs-5&quot;"/>
      <value value="&quot;sbs-6&quot;"/>
      <value value="&quot;sbs-7&quot;"/>
      <value value="&quot;sbs-8&quot;"/>
      <value value="&quot;sbs-9&quot;"/>
      <value value="&quot;sbs-10&quot;"/>
      <value value="&quot;sbs-11&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distribution">
      <value value="&quot;uniform&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="two-groups">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="discrimination">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-reservation">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-perturbation">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="base-market-price">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-of-companies">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="reservation-wage">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-M">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-F">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageM">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageF">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency-factor">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-of-efficient-companies">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="first/last-eff">
      <value value="false"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="d'Aspremont3" repetitions="50" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="3000"/>
    <exitCondition>ticks &gt; 300 and item 0 d-wF-m &lt; 0.20 and item 1 d-wF-m &lt; 0.2 and item 0 d-wM-m &lt; 0.2 and item 1 d-wM-m &lt; 0.2</exitCondition>
    <metric>[ra-profit] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-profit] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 1 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 0 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 1 (sort-on [who] companies))</metric>
    <enumeratedValueSet variable="rules">
      <value value="&quot;pricing-only&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-calculation">
      <value value="&quot;Squared&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Market-shape">
      <value value="&quot;Line&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Starting-locations">
      <value value="&quot;sbs-1&quot;"/>
      <value value="&quot;sbs-2&quot;"/>
      <value value="&quot;sbs-3&quot;"/>
      <value value="&quot;sbs-4&quot;"/>
      <value value="&quot;sbs-5&quot;"/>
      <value value="&quot;sbs-6&quot;"/>
      <value value="&quot;sbs-7&quot;"/>
      <value value="&quot;sbs-8&quot;"/>
      <value value="&quot;sbs-9&quot;"/>
      <value value="&quot;sbs-10&quot;"/>
      <value value="&quot;sbs-11&quot;"/>
      <value value="&quot;sbs-12&quot;"/>
      <value value="&quot;sbs-13&quot;"/>
      <value value="&quot;sbs-14&quot;"/>
      <value value="&quot;sbs-15&quot;"/>
      <value value="&quot;sbs-16&quot;"/>
      <value value="&quot;sbs-17&quot;"/>
      <value value="&quot;sbs-18&quot;"/>
      <value value="&quot;sbs-19&quot;"/>
      <value value="&quot;sbs-20&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distribution">
      <value value="&quot;uniform&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="two-groups">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="discrimination">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-reservation">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-perturbation">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="base-market-price">
      <value value="200"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-of-companies">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="reservation-wage">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-M">
      <value value="0.2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-F">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageM">
      <value value="200"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageF">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency-factor">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-of-efficient-companies">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="first/last-eff">
      <value value="false"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Lerner-Singer-Smithies2" repetitions="20" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="2000"/>
    <exitCondition>ticks &gt; 500 and item 0 d-wF-m &lt; 0.1 and item 1 d-wF-m &lt; 0.1 and item 0 d-wM-m &lt; 0.1 and item 1 d-wM-m &lt; 0.1 and (max dot-m) &lt; 2</exitCondition>
    <metric>[ra-profit] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-profit] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 1 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 0 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 1 (sort-on [who] companies))</metric>
    <metric>employment-rate</metric>
    <enumeratedValueSet variable="rules">
      <value value="&quot;both&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-calculation">
      <value value="&quot;Linear&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Market-shape">
      <value value="&quot;Line&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Starting-locations">
      <value value="&quot;Random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distribution">
      <value value="&quot;uniform&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="two-groups">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="discrimination">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-reservation">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-perturbation">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="base-market-price">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-of-companies">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="reservation-wage">
      <value value="90"/>
    </enumeratedValueSet>
    <steppedValueSet variable="travel-cost-M" first="1" step="0.1" last="3"/>
    <enumeratedValueSet variable="travel-cost-F">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageM">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageF">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency-factor">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-of-efficient-companies">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="first/last-eff">
      <value value="false"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Lerner-Singer-Smithies3" repetitions="20" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="2000"/>
    <exitCondition>ticks &gt; 500 and item 0 d-wF-m &lt; 0.1 and item 1 d-wF-m &lt; 0.1 and item 0 d-wM-m &lt; 0.1 and item 1 d-wM-m &lt; 0.1 and (max dot-m) &lt; 2</exitCondition>
    <metric>[ra-profit] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-profit] of (item 1 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-wageM] of (item 1 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 0 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 1 (sort-on [who] companies))</metric>
    <metric>employment-rate</metric>
    <enumeratedValueSet variable="rules">
      <value value="&quot;both&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-calculation">
      <value value="&quot;Linear&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Market-shape">
      <value value="&quot;Line&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Starting-locations">
      <value value="&quot;Random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distribution">
      <value value="&quot;uniform&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="two-groups">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="discrimination">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-reservation">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-perturbation">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="base-market-price">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-of-companies">
      <value value="2"/>
    </enumeratedValueSet>
    <steppedValueSet variable="reservation-wage" first="75" step="5" last="130"/>
    <enumeratedValueSet variable="travel-cost-M">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-F">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageM">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageF">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency-factor">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-of-efficient-companies">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="first/last-eff">
      <value value="false"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Eaton-Lipsey-line-perturbed" repetitions="10" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="2000"/>
    <exitCondition>ticks &gt; 250 and (max dot-m) &lt; 1</exitCondition>
    <metric>[ra-profit] of (item 0 (sort-on [who] companies))</metric>
    <metric>[ra-profit] of (item 1 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 0 (sort-on [who] companies))</metric>
    <metric>[pxcor] of (item 1 (sort-on [who] companies))</metric>
    <enumeratedValueSet variable="rules">
      <value value="&quot;moving-only&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distance-calculation">
      <value value="&quot;Linear&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Market-shape">
      <value value="&quot;Line&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Starting-locations">
      <value value="&quot;Socially-optimal-1D&quot;"/>
      <value value="&quot;Random&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="distribution">
      <value value="&quot;uniform&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="two-groups">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="discrimination">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-reservation">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="worker-perturbation">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="base-market-price">
      <value value="150"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Number-of-companies">
      <value value="2"/>
      <value value="3"/>
      <value value="4"/>
      <value value="5"/>
      <value value="6"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="reservation-wage">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-M">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="travel-cost-F">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageM">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="starting-wageF">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="efficiency-factor">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-of-efficient-companies">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="first/last-eff">
      <value value="false"/>
    </enumeratedValueSet>
  </experiment>
</experiments>
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
