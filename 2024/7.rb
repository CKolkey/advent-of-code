# frozen_string_literal: true

# Define a concatenation operator for integers
Integer.define_method(:"||") do |other|
  power = (Math.log10(other).to_i + 1)
  (self * (10**power)) + other
end

input = DATA.read
input = input.scan(/(\d+): ([\d ]+)/).map { _1.map(&:split).flatten.map(&:to_i) }

def process(calculation, operators)
  lhs = calculation.shift
  possible?(lhs, calculation, operators) ? lhs : 0
end

def possible?(lhs, rhs, operators)
  return false if rhs.first > lhs

  operators.any? do |operator|
    if rhs[1].nil?
      lhs == rhs[0]
    else
      rest = rhs[2..]
      new  = rhs[0].send(operator, rhs[1])
      possible?(lhs, rest.unshift(new), operators)
    end
  end
end

puts input.sum { process _1.dup, %i[* +] }    #   2_941_973_819_040
puts input.sum { process _1.dup, %i[+ * ||] } # 249_943_041_417_600


__END__
237069504000: 96 30 30 28 139 705
355813: 50 702 120 7 59
92316680: 92 22 9 66 77
3255967: 4 7 6 10 17 420 5 1 6 97
11052: 8 3 1 4 75 3 59 1 73 4 9
1257: 9 45 312
1891867: 69 96 20 573 968 1
29274: 1 4 2 9 49 435 999
735: 49 56 7
178684952: 7 944 226 9 3 9 5 87 4
931690: 6 9 6 2 21 7 1 4 8 67 53 8
3111108: 5 12 52 6 5 7 924
6367117: 386 98 15 877 97
708411564: 602 3 712 22 7 6 97 7 6
7437045: 6 4 664 6 969 77
115221283: 5 761 2 12 83
2508671041: 529 9 9 74 2 7 3 263 42
273159250: 9 607 5 924 8
43585420368: 3 2 8 42 824 6 2 9 15 9 9
2500411: 61 85 66 4 14
12278592: 919 8 275 72 803 4 6 8
20222880: 6 47 6 18 8 779 1 7 5
8485682784: 5 840 9 874 6 68 2 784
372258: 75 8 737 872 6
3814: 481 6 6 856 36
49375365299: 259 87 19 65 299
44237592313: 6 711 28 6 75 31 823
3262097: 124 43 1 156 61
12114: 12 1 3 657 18
92866410: 86 8 5 3 3 5 1 58 765
84381196: 843 81 11 8 6
3474211523: 8 5 2 890 6 9 3 45 2 3
3989216025: 89 409 6 52 80 19 4
113683: 90 8 440 98 3
35919085: 6 17 4 9 9 105 15 332 5
1276027208: 7 8 9 45 8 6 3 364 205
3755300: 47 5 188 85
400540: 4 86 607 6 6 7 70 1 10
136298: 1 2 3 1 8 9 5 7 3 30 3 128
341550: 3 50 706 50 9
466: 14 361 9 75 7
993: 72 2 7 3 95 167
2137: 1 7 14 90 6 889 8 9 8 2 9
51007: 4 1 22 46 6 5 37 41
115824871066: 98 30 694 3 90 9 8 8 6
3049865: 209 912 8 16 9
682764373: 95 819 747 6 370
28117542: 1 2 28 6 15 2 8 3 698 5 2
787360: 10 72 20 2 532
272177752: 37 6 147 5 1 94 187 79
270638934900305: 601 419 85 533 4 45 3
177686786: 489 13 1 394 2 28 82 4
8091273930: 15 299 531 996 6
1297565607: 353 3 6 8 7 4 9 81 4 16 7
406397250: 1 6 5 4 3 5 523 5 75 2 7 5
792296: 81 68 97
670106431: 97 7 86 661 630
17279687695: 4 3 1 1 8 91 1 17 4 8 9 8
16481196306: 3 5 4 841 518 69 4 999
2700: 64 22 4 6 5
1802736: 6 6 11 9 207 1 2 99 624
148727240: 474 9 1 733 6 5 6 7
14003808: 1 41 8 425 5 9 42 4 4
7219781: 735 824 4 991 37 9 3 8
17635772870: 7 7 769 4 9 9 90 6 7 13
1238645: 825 3 91 5 690
297593858: 5 595 934 4 57
221224903: 5 63 232 661 61 7 3 52
175925: 73 9 4 38 7 99
40: 5 8 1
98942419: 8 4 224 8 6 25 6 3 307
8985535057: 641 82 39 28 7 4 5 86
9070: 4 42 8 6 4 8 27 23 87 93
6479532: 2 1 9 46 6 57
27783036: 926 10 3 3 5
175703: 10 5 16 4 7 5
91287: 7 125 37 8 7
7599577: 8 751 12 1 760 9 755
41062428: 412 95 51 64 4 9 396 1
132958: 9 8 36 38 66 34
23980403928: 5 8 14 163 3 923 8 449
36112462: 360 4 7 246 2
9094648: 90 9 4 1 646
348875652: 69 77 5 5 655
2181061: 233 6 52 2 4 30 1
1317288: 4 151 236 2 9 9 70 2 3 4
510561: 4 710 3 82 71 9
831427: 93 4 294 455 5 977
1997: 7 8 55 3 6
1167: 143 1 5 16 1 989 13 1
169011360: 598 828 32 69 35 4 12
4839: 67 72 15
933064: 37 272 3 75 92
291744440: 3 399 7 7 717 4 1 7 3 4 8
23048: 5 8 36 4 2 4
1909575240: 443 93 5 927 8 151 1
98778: 7 8 220 4 4 7 99 2
2649449: 916 329 56 38 9 80
7996: 795 92 9 6 6
2162145: 83 1 55 17 915
12612783: 65 9 7 770 46 4
41595: 4 7 27 3 3 3 8 9 6 7 608
162017397: 385 755 42 28 1 6
12360213: 409 521 7 58 645
77734358: 6 612 6 5 67 7 103 5 9 8
1042471: 5 883 31 9 78 3 1
2832102: 43 94 3 86 7
14118694632: 2 413 30 343 5 54 3 1 7
5634124: 56 2 98 9 34 24
596: 6 56 21 36 477
281900625: 56 63 8 11 2 5 41 15 95
5873677056: 7 7 29 1 552 20 8 936
365947: 3 65 948
431340: 847 7 12 695 65
474147: 33 95 7 2 528
64272120: 3 298 462 11 2 319 4 6
4838900: 47 62 89 35 250 88 98
1231: 5 80 3 3 26 3
486173: 3 69 326 9 4 7 32 541
204659: 204 8 8 930 59
84678574: 7 1 760 66 9 1 46 85 74
1160233201: 149 36 42 515 10 1
25716872: 9 1 2 1 88 9 92 8 9 158 2
302296176: 59 51 26 138 28
1898800: 623 4 33 94 8
15237: 73 7 35 5 688 549
1551395933257: 7 2 8 1 62 79 9 7 321 4 4
157899: 408 510 172
218738622: 6 1 6 6 30 8 73 2 5 2 957
25169: 63 288 83 29 2
1831746686: 708 210 10 8 59 154
39173640951: 69 645 9 9 6 88 8 72 79
57468: 79 5 777 3 22 8 634
46497: 23 47 7 371 9 6
9073901: 96 528 94 10 259
23869007: 119 8 938 390 93 2
2296: 6 211 77 263 4 68
96549347: 96 542 7 34 7
871130324: 8 572 8 2 56 29 5 7 482
637440160: 9 4 7 3 9 40 7 5 480 160
65110: 44 2 739 76 2
348: 3 40 6
3788: 972 842 2 89 71
15869846: 80 6 6 58 563 2
37581151: 75 5 8 1 151
2024944110: 326 9 5 147 939
2346776: 58 12 68 17 697 72 4
32691: 30 88 93 88 1
128421240: 61 49 8 7 77 99 672 8 3
89460: 71 7 4 5 9
34930: 1 5 992 5 7
9112: 23 3 2 6 6 6 2 66 50 17
380311103943: 7 560 733 97 2 943
39671: 33 12 6 2 9
101958385429339: 57 5 6 718 70 469 7 7 9
771912: 24 944 733 1 33 3 72 1
124136: 2 218 876 94 808
96205937575: 861 4 87 7 404 4 9 275
10605: 4 8 4 6 4 3 56 1 9 781 1 3
9208811: 99 3 9 2 875 6 3
4122727366: 21 5 7 7 4 5 564 4 40 7
7174362: 3 3 5 33 66 634 23 94
823914: 82 38 46 3 64
1697767030: 8 304 9 126 2 69 67 7 4
3728: 335 97 33 4 2 8
54243: 8 2 123 41 52 41
199578543: 2 494 642 9 888 8 6
47208016834: 2 62 266 6 1 9 3 2 4 1 7 2
20468171570: 68 700 3 90 9 430
221319: 16 5 199 428 891
399: 2 1 12 377 8
510: 6 1 85
55746468: 3 55 3 368 51 918 6
111380647958: 98 9 6 3 4 8 2 599 8 3 1 9
5730: 7 9 97 78 20 871 99
532422: 9 84 438 999 9 4 413
46788865: 7 1 486 7 6 2 814 2 6 43
6985667702: 39 395 7 846 2 3 906 2
203274: 78 4 822 355 3
2727144: 7 921 47 7 9
398839: 741 55 97 68 5 14
2347797: 891 9 6 4 4 645
411362494: 528 7 36 6 1 778 440
51628: 6 8 460 107 903 8
49449627171: 7 2 96 9 73 14 7 1 7 7 9
2414114: 90 1 893 3 3 330
36287514: 7 439 812 723 11
134576739: 278 8 9 9 528 1 4 8 3 1 2
14360068890: 8 711 18 9 7 5 352 1 90
23436: 5 88 7 8 217
31865702400: 444 8 8 8 5 7 5 89 9
20333: 5 3 6 6 26 3 3 7 491 52 8
3038904: 2 336 70 455 1 36 3 6 9
4103: 63 24 8 2 5 610 3
362316954904: 807 3 44 7 51 452 2
589186620: 713 43 328 6 5 32 6 66
3154744619: 7 43 7 527 151 9 257
1029422: 250 3 686 29 182 2
503327166190: 4 80 6 1 8 2 2 6 93 61 89
1007217: 99 6 50 68 23 1
654480: 8 36 6 9 60 1 36
434734: 688 5 627 9 214
280500027: 925 9 927 42 9 3 905 7
14482075: 5 67 6 24 31 72 3 561
40750: 9 84 40 19 50 1
9602155248: 8 51 5 6 4 9 9 6 56 7 98 8
40018884: 183 18 6 33 52 51 7
261: 30 3 2 8 69 4
28553731: 327 74 59 4 5 79 12 1
2446038: 7 85 6 685 588
30736299: 819 3 8 859 6 13 53 9
277196: 74 92 3 9 5 441 8 868
8980472578: 6 7 8 64 7 467 1 22 647
172874739239: 2 9 83 8 82 4 9 9 9 3 105
20221385: 318 693 2 1 38 2
2011: 10 3 1 8 3 8 5 89
193812789: 19 300 4 17 3 788 789
9636: 4 988 614 6
166155567: 69 49 4 9 533 673 661
717091552: 2 963 6 7 76 1 3 2 4 68 1
116610: 83 7 101 47 4 74 39
25697: 40 2 79 979 2 79 3 3 5 7
14114: 546 437 48 6 522 9 83
29160403: 405 6 12 269 5 129
1510: 4 5 8 7 9 799
291570: 8 60 534 8 598 476
7946546: 132 657 5 654 7
11666304: 22 4 6 76 2 492
79766: 4 5 1 6 50 2 2 2 591 572
12190: 16 4 4 7 2 46
9239904443: 9 234 5 891 3 8 2 4 3 2 8
239261124022: 242 766 999 2 1 646
782666281: 7 7 6 139 7 38 9 8 73 8 1
5578997760: 920 56 8 2 8 846
510528: 163 6 5 31 2 9 4 7 6 4 8 6
73981818418: 1 3 7 6 9 177 4 8 415 3
213301702: 5 2 6 84 2 25 284 6 1
19955520: 3 8 6 3 90 36 5 845 8 9 2
595066500: 90 89 86 7 1 7 250 6
286394460: 69 83 8 892 5
5538831: 998 45 9 1 8 59 28
1205296694: 704 8 3 80 71 68 9 5
1173717: 1 2 74 6 469 8 4 3 44 3 9
906238: 55 98 168 718
383753: 1 7 685 7 549
6905408: 690 433 14 93 7
985142648: 345 7 34 932 3 8
3620429290: 451 30 4 4 94 8 9 8 32 1
678: 4 3 2 652 2
293253492177: 5 199 5 3 6 94 14 1 35
69905: 8 3 6 39 38 21 8 31
9345568: 8 5 1 7 253 6 517 854 8
646000: 4 97 441 750 500
764501184889: 555 92 18 764 889
52151238: 1 1 516 39 839 990 17
25969550: 22 15 7 695 50
11766013317: 9 2 2 7 4 75 6 642 7 2 9 7
2859: 11 3 8 19 8
64: 56 4 1 3
376347: 12 544 3 7 3
366815: 450 813 3 14 948
6857620: 6 56 5 6 7 671 20
1179612: 2 311 4 6 6 62
1555199: 4 777 2 40 5
9867484: 2 982 2 748 5
478817: 7 684 11 6
489547800: 2 1 5 7 880 7 500 7 81 2
111801: 58 8 8 2 3 6 5 9 6 2 6 9
9624: 12 1 40 442 1
73892124: 2 8 5 754 7 7 8 2 8 5 5 69
1965299158: 82 496 34 99 159
5821016496: 379 5 202 257 4 8 73 4
4291587636: 7 86 4 7 2 5 812 27 4 8 7
1651005720: 78 9 1 83 3 14 642 13 6
62578: 8 4 67 310 2 7 1 9 1 8 1 1
99567955245: 287 7 5 45 74 9 552 48
2605913046: 1 8 4 1 1 858 9 393 6 99
13790287218: 813 17 569 11 73 1 4
5516882: 7 788 3 18 564
4055397: 427 95 549 736 92 37
749152: 8 6 3 2 9 706 6 4 1 27 8 8
68885: 688 8 5
497344120: 8 91 9 19 149 917 4
2647674: 7 42 1 8 6 9
45468591: 4 5 46 85 89
168921310163: 515 164 655 2 161
2782959: 278 23 23 627 9
3826134425890: 6 545 2 234 85 174 4 5
142643443: 385 95 2 4 39 5
31654497: 4 6 69 4 819 1 594 14 7
3338528657: 6 5 2 8 1 9 7 965 13 385
83238611: 69 8 835 2 6 6 7 1 5 5 8 3
104191387: 3 84 2 7 1 8 1 191 378 7
9913380: 8 9 374 93 3 4 8 4 3 12
2622141784413: 7 6 4 2 5 365 3 66 2 47 6
8378783370: 871 25 7 1 765 2 873
160937: 447 360 8 9
2440: 262 5 6 62 766 10
260344: 6 7 7 3 5 3 87 716 2
208727566608723: 4 9 6 94 2 516 814 721
887972: 60 3 1 1 157 72 4 4 93 2
147299: 917 555 1 4 85
1391335886: 22 39 16 1 617 888
23745790: 77 855 305 7 8
4377065: 6 93 1 7 8 6 87 9 7 391
54734505971281: 42 847 32 8 59 499 8 1
435988544: 14 6 3 4 952 4 2 7 7 1 47
5921364325140: 83 4 287 560 3 9 6 6 99
11392192: 3 9 8 5 7 1 9 17 4 7 4 944
1153645: 64 3 6 9 4 977 2 4 1 5 8 5
5633136: 5 8 1 43 136
2865654424: 4 894 5 2 8 6 120 683 8
104876: 5 3 33 2 487 71 3 6
44772705: 3 26 1 792 1 3 5 7 8 8 79
5354298: 8 520 9 75 2 80 2 109
2072744124: 4 87 65 419 974 836
9592579: 95 916 9 7 6
52518780: 5 2 466 4 7 8 9 15 6 34
122260: 59 598 186 58 1
8460202958: 29 4 71 4 9 627 91 956
152: 6 81 65
137650796900: 562 299 72 50 34
216905: 1 2 2 351 611
49805150: 17 68 861 787 50
234855903: 275 1 8 4 34 5 2 7 9 5 3
791572768: 879 9 59 413 766
4328936: 538 3 8 899 34
28075: 1 4 1 929 3 1 9 6 65 68
1559: 71 46 9 9 425
1038096490: 1 2 38 91 6 88 5 3 4 90
847147248: 639 9 358 856 81 2
268127: 757 246 5 44 53
5750108: 754 1 4 2 136 7 20 8
41916: 408 6 98 880 96 368
7607: 2 839 1 9 38
1872381: 159 368 8 4
76433449: 8 9 93 7 9 2 1 8 276 8 79
85116: 2 45 9 851 867
3171592: 31 71 3 94 2 93 103
47589719: 118 1 1 357 897 19
43416749: 4 288 27 2 375
92974345208: 701 417 837 5 38
383334669: 47 911 33 5 3 34 8
3303: 108 4 26 390 1
1248898639: 84 9 1 83 3 6 8 1 2 1 6 39
275175: 4 2 6 7 8 39 3 153 2 9
364343670005: 7 183 5 702 6 4 5 810 2
51244048440: 39 99 415 63 615 13 4
170715797: 16 2 74 8 5 1 6 5 6 9 89 2
32309: 257 56 5 9 950
1043218: 141 85 6 87 1
1458: 5 86 4 936 88
40086: 91 5 88 38 6 2
31644: 8 6 71 231 45
36905: 42 9 26 8 55 55
32361088: 854 64 8 37 8 2
7922781: 80 44 484 4 11 5 3 654
657865: 50 9 660 9 64 4 63 65
884583: 8 845 83
111180: 2 80 9 7 8 430 2 1 6 3 68
7624: 75 42 37 38 8 1
5892532: 19 8 5 4 99 29 4 410 5 7
1047913: 89 253 6 5 3 5 51 730
8301: 8 99 77 9 50 3
1313532272: 107 124 990 94 180
840: 67 3 770
361138: 8 7 4 548 3 6 334 1 8 9 2
174855991: 221 3 3 67 79
833111: 302 55 476 11 2
8754548349: 8 32 9 4 7 7 24 2 4 83 5 2
601584: 948 633 253 833 414
6126309: 983 5 694 78 7 2 169 7
64819881584: 1 9 7 45 14 8 9 81 5 8 1
5967559: 93 64 8 7 559
16328160: 90 403 690 48 1
513532: 258 2 6 6 36 9 3 310 6
15655747: 9 3 9 1 6 7 572 34 91 7 9
237684: 7 7 92 70 322 759 42 6
27048: 6 98 65 4 8
1048973: 52 70 55 38 281
10939115: 45 963 5 69 252 47
19837: 9 11 990 28 9
473835: 8 93 3 21 5 3 6 633 7 2
504234: 29 6 49 6 237
5494944: 230 36 5 3 663
69796160: 4 8 57 796 161
29096760: 3 6 71 87 159 517 4 6 7
12021: 64 26 18 4 1 6 8 78 7 2
853987: 8 394 8 3 6 6 629 83
6750233825: 31 296 5 4 3 8 343 714
469826: 34 8 556 3 6 86 9 8
347521988: 495 90 4 1 78 8
549: 55 9 8 44 2
398696370: 18 88 5 9 51 28 7 978 5
865398616: 9 40 8 1 19 51 5 9 2 2 8 7
56130: 9 7 9 3 1 7 1 45 39 7 5 5
563500: 28 4 17 112 70 50
4921246: 86 73 1 6 87 10 9 1
716419908: 3 66 5 1 79 6 365 8 92 9
47913: 4 1 74 5 1 10 3
149522: 6 1 4 7 8 9 3 8 64 8 888 4
140791326: 41 788 80 63 10 69
24696560: 7 20 3 4 3 5 1 294 5 2 8 7
83096679: 127 2 644 508 71
64889: 9 913 7 34 7
2984011: 8 6 89 357 6 61 196
261145500: 9 350 98 285 3
9066797: 452 48 86 50 4
424912: 68 6 333 2 2 3 87 4
408789: 42 4 752 88 524 274 5
7029: 52 32 197 25 4
25547: 33 4 9 319 293 1 3 9 5
5668: 7 66 71 7 3 325
235593690: 650 59 65 2 759 4 91
494539813: 4 938 7 398 13
748: 657 5 72 5 9
50702: 3 770 434 2 3 7 8
1379822126: 62 315 2 366 425 5
23041257515: 40 3 63 8 617 8 9 5 14
249356: 2 74 91 1 8
4414939: 4 414 93 4 4
5040197806: 86 372 726 526 217
20347534480: 22 633 5 20 899
18580386: 1 1 44 2 2 3 6 51 4 5 6 11
1701511: 20 2 3 83 13
310943: 4 26 8 9 3 419 1
183224: 4 9 380 73 6 1 30 978 8
73103: 61 296 3 4 68
31772: 225 3 8 889 2
1178: 6 96 5 554 43
1165635: 4 5 6 37 7 50 6 95 6 34
521557938: 651 1 2 4 74 6 9 2 7 2
274204: 42 227 259 7 4
149803482352: 156 8 4 5 9 48 9 5 118 3
605018: 97 693 9 20 9
6871840: 41 1 963 1 1 5 6 22 4 29
8429236: 8 5 9 486 5 788
26334230: 6 56 44 8 6 72 201 5 9
354645: 318 136 978 8 837
222371712: 7 9 4 579 9 26 7 79 3 7 9
583654: 8 6 9 303 54 1 3 736 6
2086560: 2 717 6 69 21
1354419: 90 5 373 681 406 12 3
1289: 46 40 6 427 339 5 2
16998959: 5 910 4 934 71 88
796: 8 7 655 84 1
518817357: 3 929 658 94 309 9
1619705: 8 337 2 19 59 2 25 1 3 2
86126152: 89 3 6 8 4 84 131 2 6 5 3
279794895: 41 512 1 4 68 2 1 7 5 7 9
11992270: 802 941 860 48 5 8 3 3
169258681081728: 4 2 314 670 2 7 4 1 72 8
31080912061057: 662 939 24 12 21 1 5
19148: 9 71 651 522 5 85 3 98
899771738: 7 155 37 829 6
341754594416: 4 5 85 271 54 7 4 67 3
340337738: 95 44 1 2 8 33 4 5 9 9 3 6
289414: 22 657 9 69 88 2
63360363758: 94 6 68 21 51 4 87 27 8
171845234: 9 3 7 8 8 61 9 8 5 97 34
1121977715637: 98 71 75 1 5 43 635
9144808: 7 87 65 330 71 5 2 4
1481713: 3 82 63 14 2 31 82
13345: 2 413 105 691 11 2 22
74111931179: 92 959 2 895 8 76 420
581756: 57 1 8 3 758
12169: 747 543 9 5 554
238685361: 34 1 75 6 716 711 8 4
177684: 783 901 594 78
36733617: 145 319 9 794 1
85822: 6 2 40 8 5 3 73 94
4243328964: 185 2 9 84 2 6 42 2 21
8622560552: 1 82 9 9 5 5 5 59 8 7 5 3
30722403: 327 77 5 632 75
249734635: 3 543 87 417 349 3 4
917934: 9 17 8 96 38
22698: 6 9 42 9 6
1813: 54 205 37 6 33 4
15798: 72 83 2 91 9
206141781120: 9 954 3 3 7 226 4 80
1603475788: 5 8 9 8 9 2 457 7 1 6 53 5
2834847: 288 41 4 3 5 60 377 70
549488: 1 460 30 73 976
528868: 1 1 2 674 78 8 20
779390010: 4 7 5 4 3 6 361 65 91 7 5
390488: 449 6 3 4 5 16 716 4 38
173793107: 500 101 4 85 172 5 7
37492680: 1 97 1 21 9 8 927 960 5
4224: 301 78 9 9 9 2 412 237
9492503: 943 293 8 20 2 3 8 7 8 8
1649632415: 48 4 541 4 8 1 63 702 5
362304: 8 40 629 6 2
33100412: 6 353 8 1 78 10 7 6 9 96
975: 2 719 39 209 6
23945: 9 393 8 3 707 858 5 5
1014: 4 6 1 4
19452231: 84 310 9 83 351
646720: 90 6 117 39 688 688
1720919400: 358 5 4 604 391 60 2
520067: 78 8 4 1 3 33 4 74 455 2
122: 3 97 1 21 1
73957341622897: 9 2 7 9 3 369 90 2 862 8
566255566198: 785 1 1 4 6 6 9 5 77 4 8 6
49622: 4 3 4 5 50 7 1 23
139331: 39 42 1 860 2 4 7
2062460: 7 343 177 8 58
10823346606: 59 2 287 9 4 915 3 93
820253: 3 6 89 8 6 44 3 56 2 9 6 5
420736258837: 71 311 230 31 59 7
38750: 51 630 23 55 31
86950: 82 36 41 544 454
10682880: 2 321 5 64 52
34112010240: 96 968 8 57 805 1
129014: 5 14 251
25968364: 3 2 9 2 1 71 1 3 5 7 2 761
258162800: 869 4 3 7 847 673 20
30630: 335 46 8 2 12 1 9
226110: 223 2 933 96 81
634800: 5 2 9 175 269 2 690
311: 9 11 7 2 169
62617: 16 98 510 5 8 6 227 2
182964015: 899 310 59 513 5
1100758: 6 4 504 91 3 19
3942347909: 7 5 2 547 65 6 8 33 6 2 3
280898183289: 86 5 4 420 31 8 88 8 89
9983283: 501 496 5 8 2 80
10747859: 38 91 111 7 21 4 312
938: 536 3 5 20 65 309
22361: 8 211 4 58
399654: 77 863 93 65 6
108209773: 51 26 68 5 3 3 70 4 693
305118: 41 397 68 9 67
3424261494: 1 8 19 4 261 492
43544170: 8 68 8 5 1 929 84 81 1
611980072: 572 123 29 5 9 19 88
13381485: 34 2 1 623 3 65
2312486114: 362 117 769 71 68
5316350: 2 261 9 63 51
6018738: 1 3 90 6 4 7 64 1 7 7 2 6
188: 14 7 67 8 92
19913715: 81 4 241 4 5 255
2271848065: 609 8 3 5 4 92 65
11206: 91 396 23 4 1
424434: 630 84 6 8 2 8 6 6 1 934
40642395: 4 12 5 62 88 535 93
4875: 62 7 2 16 56
15714: 4 2 48 230 5 72 5 4
183787176: 822 52 37 8 537
259167840: 5 7 8 6 903 51 816 8 41
637776878: 43 16 927 870 6
3998250: 11 323 3 3 375
14273886977: 199 2 292 566 25 217
188: 9 4 2
464170402: 928 331 9 8 50
36738891: 77 477 9 8 83 8
536328: 73 266 446 27
1932: 4 163 90 65 6
4471181453430: 9 70 6 6 5 2 59 853 9 3
1010888: 39 72 36 8 3
7283692: 867 84 8 91
41750873: 3 25 36 653 8 9 8 9 17
3506152: 4 688 637 46 6 2
617650487: 38 4 1 1 11 4 402
1530026: 6 78 38 7 86
72172165: 344 6 22 8 8 645 538 3
10275506472: 30 1 3 2 69 341 5 2 1 1 1
14944995: 5 2 8 64 9 3 15 767
8809031: 53 11 74 6 310 60 7 4
386665: 4 32 9 49 85
3433815: 861 5 4 1 991
38882: 547 7 1 591
206319558: 5 86 2 6 55 916 195 55
35848233: 714 54 4 2 875 909
278: 32 4 88 60 2
4529: 624 1 23 7
3056508000703: 7 351 40 50 622 69 3 9
743851143: 103 7 4 8 51 4 7 2 3 3 7 4
569: 7 57 80 1 90
2477347208185: 2 478 53 18 541 8 187
2211258037: 5 72 74 978 35 37
131240: 330 76 323 97 5
303451: 260 43 4 42 9
1375045632: 6 7 9 6 7 37 6 6 6 8 96 3
900: 3 9 81 7 9
9017376: 2 81 793 8 1 4
31854: 1 83 146 8 806 7 4 6 3
8899350286: 5 6 3 711 530 894 463
12087785589: 1 995 3 9 3 4 5 9 3 8 589
3433209: 572 201 6
711980: 51 5 68 411 970
110044: 276 6 5 20 820 44
34500428: 8 955 6 77 8 9 5 1 495
10437: 7 6 8 6 9 8 96 54 2 2 7
9526930631: 2 3 81 6 9 4 2 12 53 7 4
5831: 7 8 3 13 289 7 2 866 5 1
5841776: 8 104 1 15 8 8 3 3 7 184
2012810: 3 7 8 6 3 5 245 191 625
42840: 2 686 77 2 28
16834553255: 417 724 44 641 403
3578: 71 7 5 7 848
214553838357: 861 655 7 249 356
112137: 10 72 1 664 50 26 1 3 9
86111527: 2 152 772 15 7 4 4
1438: 6 3 7 92 5 6 93 2 9 142 9
5963942: 6 33 556 55 5 842
1809: 6 1 69 1 532 313 888
1346526720: 85 9 8 8 725 7 184 704
23746365: 15 685 72 9 255
44157722065: 4 4 513 6 4 9 45 49 4 64
19388160: 9 6 399 26 272 6 9 3
31874414: 6 622 462 1 8 950 9 4 1
155254467409: 7 34 38 3 9 4 8 7 6 7 409
7488740: 26 8 6 6 740
737225700: 50 65 504 276 2 6 8 75
186743803: 14 4 674 3 126 676
31374: 60 6 36 14 3 504 9 18
858491: 5 422 335 6 221
1404417: 844 8 26 8 1
1824766: 320 60 7 686 6
25867127169: 106 75 78 473 81 299
6147278: 1 99 584 9 2 79
65989578: 857 77 56 1 8
1351: 24 605 710 12
475680012600: 5 985 6 4 4 8 75 63 4 50
1479825: 2 9 5 383 763 6 7 38 1
3870766: 32 31 1 5 84 6 4 1 6 46
222359: 80 25 7 42 78 5
8037677: 46 60 52 28 2 536 5 16
18009543: 178 45 1 8 8 20 3 72 40
112178952: 3 24 824 7 9 7 566 3 8 9
1923: 15 58 358 3 6
6435890: 8 63 5 9 7 35 66 4 83
2863025: 4 6 8 2 2 6 3 8 367 5 55
40411: 9 9 36 22 4 243 11
54585: 4 2 6 6 9 2 1 1 446 9 5 9
267657: 9 9 8 6 3 34 82 9
2796417: 5 20 7 5 77 117 93
6722720550: 9 8 699 565 2 7 629 6 5
21376691: 625 9 4 461 931
129121866640: 5 86 401 5 2 187 34 4 3
82: 4 2 74
160724791752: 933 2 188 534 32 861
1397630: 2 226 945 1 598 32
104983: 721 8 9 8 2 7
633707226: 2 8 99 1 4 3 26 346 22 6
384219200: 6 9 4 86 4 63 3 857 8 41
23133242293: 6 5 8 8 43 105 1 47 3 9
176306130: 92 3 33 618 91
27635920726: 112 6 5 1 5 9 1 520 7 2 6
50564: 7 491 11 65 688
1156: 11 48 4 7 1
15416: 140 50 524 756 86
161994: 7 8 3 5 8 1 4 9 31 8 67 6
39386948: 7 66 89 783 94 8
24255: 35 9 77
120187745: 70 1 168 70 2 2 5 73 34
47705: 4 7 8 836 3 9 7 22 3 8 3 1
6090760: 3 57 42 26 845
13881: 22 877 256 3 4 9 8 4
46461312: 89 14 55 62 6 4 24
6250228269: 18 8 68 121 432
6383118: 1 7 9 612 726 9 14
38781608135: 9 7 34 14 2 88 14 4 452
92288: 737 29 882 7 8
112928510456: 75 4 8 5 39 1 4 9 48 56
3331441: 7 671 4 4 971 69 105 1
7458037: 85 552 5 234 513 2 4
1873: 8 8 3 699 871 42
4144: 33 93 13 87 975
93888361566: 78 3 8 7 4 995 4 4 1 5 64
1625400: 207 8 9 4 3 9 3 432 15 7
8548173: 85 4 8 171 2
523899888: 41 678 66 7 138 8
826762114: 4 5 205 5 9 3 898 1 456
26131808416: 628 4 6 5 8 7 999 8 59 6
579359: 8 723 80 2 877
659088: 4 8 580 20 115 3 66 92
91260: 2 6 9 61 540
26960754744: 700 81 27 161 3 984
38962: 38 35 944 8 730
2477734: 3 4 4 748 24 922 3 8 4 9
70122: 3 8 5 6 3 1 5 5 502 2 9 31
17784: 18 96 43 50 24 2 6 38
22593450: 6 60 76 26 825
678: 2 2 8 4 278 384
43998707: 283 69 6 797 373
94836: 4 418 586 6 7
1820590087408: 200 4 768 400 1 8 926
688680: 978 45 7 490 15 15 6
106631: 20 8 858 17 8 8
5404060: 8 21 6 10 6 3 5 112 4 8 5
1599066: 65 41 1 1 6
2023517: 4 1 45 4 9 8 891 19 37
939209242: 65 3 708 59 68 42
174049: 6 2 6 1 4 634 8 9 2 37 6
15021: 34 7 301 6 42 395 4 1 6
14648089: 68 131 2 3 548 49
6034061: 697 7 174 78 1 84 14 5
11010: 9 3 12 6 5 9
3221245: 2 1 22 12 4 5
5573841: 7 3 5 4 401 2 7 5 8 33 8 9
2209501: 8 9 934 7 5 139 6 5 780
20210540773: 6 41 47 820 773
84048: 2 420 16 22 9
2271918080: 7 5 8 9 6 4 86 9 3 720 8 8
42887611650: 2 944 7 1 58 23 5 390
586845: 724 5 81
9826292880: 7 360 907 984 30
28679847: 7 3 3 185 3 9 44 1 1 2 1 7
10776864: 23 6 63 66 6 812
43111: 61 1 684 5 698
19543780: 5 6 7 386 314 1 2 4 4 5 4
8862: 97 5 223 7 4 1 6 5 883
100858024: 2 110 9 580 23
8795: 79 5 22 8 1 97
11754330: 3 9 827 571 6 509 502
8670: 5 5 6 69 3 34
2460074832: 98 74 989 7 49 628
4628655366749: 336 159 12 722 67 49
818733616627: 8 11 4 3 73 354 7 6 630
68629528: 404 2 8 12 18 22 7 4 8
1893617: 35 75 1 5 80 9 9 6 2
38138762: 5 499 40 720 7 835 9
4166: 7 1 85 7 1
9060263911: 7 3 83 7 6 6 950 9 9 9 4
3189914: 474 41 9 7 3 22 4 4 91
13525161849: 229 24 59 184 9
604493820: 8 699 804 76 945
1707917817904: 82 635 66 518 328
4977357580: 96 50 3 9 287 5 68
9076536: 621 8 21 87
69769617: 697 6 9 619
7004: 4 1 3 863 4 2 4
1494087678076: 9 3 498 3 5 50 3 5 6 5 7 7
50653588160: 47 590 4 2 733 94 623
23676384741: 723 2 64 3 58 5 84 744
43893055008: 23 729 4 888 737
5274417095: 3 55 829 949 9 66 2 7 8
2215: 6 838 45 532 782 12
214112: 5 9 3 361 39
12804634104: 3 40 5 5 876 81 74 316
124884: 8 5 465 7 52 70 4 4 9 1 1
2593468329: 9 3 15 6 6 111 6 2 2 6 5 2
129276: 9 26 9 532
1692128359129: 6 7 685 134 2 5 7 5 6 2 9
579105175: 578 4 7 37 117 83 7 25
7316537: 2 4 68 7 2 874 3 78 159
3015: 9 38 9 1 7 281 365 3
99097600: 6 3 7 7 9 38 64 70 280
1042: 559 462 7 5 9
13454: 8 3 926 957 7 36 69
40525369: 82 641 771 1 67
207940: 7 8 554 1 89 4 79 12
482632192: 61 412 51 6 92 193
499810500: 903 30 9 82 25
80462: 8 76 841 55 765 2
43767147: 4 376 714 9
3457: 253 13 161 7
760: 69 6 8 86 73 1
531079911: 64 85 387 4 921
588061416: 4 6 7 4 7 9 5 3 45 9 4
27216918: 72 3 6 36 7 75 143
385666677: 881 5 76 18 8 8 8 53
130004820: 92 303 64 517 9
49967040: 164 1 2 42 116 96 73
3408: 62 164 7 193 8
595446: 8 93 27 8 30
1022124: 8 691 6 5 1 6 27 3 3 66
499993425: 7 5 101 660 87 347 2 5
88596602: 7 434 4 9 809 324 4 98
420: 5 87 3 1 16 66 1 58 4
48663888: 4 1 6 329 8 5 73 1 2 7 8 3
265139504194: 1 39 87 4 659 8 81 9 91
3260115: 383 6 59 9 93
1490656: 2 7 7 2 82 164 766 2 7 6
57342664: 907 3 2 63 62
573144148101: 954 80 775 2 9 969
15462181: 163 85 558 2
920: 2 7 8 3 39 1 8
665550: 178 3 805 9 75
30508: 64 462 40 896 3
481630: 48 1 32 5 302
245688473: 9 473 646 8 8 469 58 9
3760: 5 3 4 8 94
34608191219: 11 846 1 42 93 952 35
2176096: 74 39 12 4 400 1 9 14 4
19441660: 997 195 3 13 10
3560743358: 9 39 80 6 5 6 79 9 6 318
33572702: 37 3 360 8 7 2 51 3 35 2
374610584590: 81 5 1 326 7 4 6 6 331 9
29793907695: 3 69 508 9 7 587 62 6 5
2407: 1 1 4 1 79 518 741 828
50857980: 47 486 67 3 740
435912: 60 896 2 26 443
61272: 4 6 835 43 69
10516068: 65 4 2 813 3 3 9 162 2 3
2122: 6 342 70
131834: 425 4 68 500 5 58
321214243: 237 92 45 57 3 51 4 3
2971: 40 1 97 1 14 986 53
116: 1 4 7 10 6
432138: 52 9 3 8 3 63 97 3
1866564: 3 72 4 9 710 46 5 3 3 36
719413: 442 6 61 91 91 2 5 77
2123870: 3 151 674 5 88
7641: 37 811 9 9
7462128862: 199 6 5 455 8 16 865
3158238: 25 96 758 154 85
30721860750: 6 512 185 63 37 7 48
408: 5 15 5 5 8
13552704: 8 2 5 982 6 7 5 2 2 8 46
720972: 4 57 3 734 9 6 3 5 4 9 84
3827862: 5 36 7 5 9 548 7 61 661
94229670: 53 993 986 9 88 7 45
94786045: 94 34 44 60 42
1273534211: 453 7 619 247 2 213
92180160893: 4 5 14 1 8 3 7 908 8 89 3
1335205: 111 6 7 9 20 6
179104519445: 878 669 8 605 63 5
201325: 704 453 29 6 7
4134394384: 6 89 6 394 381
5636785: 97 95 2 368 3 4 7 4 3 1 7
151650: 6 153 4 8 655 6
5367: 731 8 6 6 927
35432: 43 4 9 631 96
258100658: 6 19 809 89 6 8 3 4 5 3 9
2412169452: 473 413 49 3 84
1143: 7 862 95 89 90
10295096979: 3 499 924 7 54 301 68
19843: 74 268 6 2 3
85363464588: 2 34 304 2 20 47 12 23
81113: 721 83 7 1 3
45752: 7 7 295 7 19
1433638: 3 452 7 9 50 57 320 11
5595044: 2 220 12 3 21 5 8
14283588: 5 9 26 8 241
351804155: 983 4 502 19 5 8 71 4
146764905: 7 182 6 315 7 13 7 4 77
455788734: 49 65 18 34 51
44513169: 25 89 6 581 2 7
82172473: 1 362 73 9 3 9 9 31 25
121716: 1 6 42 207 2
61611946: 5 17 3 663 6 8 1 22 660
445977: 1 48 1 91 76 1
1295228700: 58 99 6 149 3 7 75 3 79
143627: 6 98 738 2 7
2659746: 4 9 9 6 84 146 2 6 3 6 6
6125686: 76 13 1 62 86
48086976: 53 8 41 346 487 168 8
4043589: 8 6 9 347 5 3 6 8 3 5 4 5
