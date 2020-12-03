# frozen_string_literal: true

LIST = [
  "3-4 j: tjjj", "7-10 h: nhhhhhgghphhh", "7-13 j: tpscbbstbdjsjbtcpj", "4-13 l: ckllmqzlvcsxpplqg", "3-11 n: nnrhnnnnnnnwsdnnnm",
  "5-6 d: ddddddb", "7-10 z: szfwzrbzzz", "1-10 w: wwwwwcwwwrpnwzwxww", "5-6 w: cgwppfwlwrwtnw", "12-13 m: bmmthmmhmmmbmmmmm",
  "1-4 b: gbbj", "10-14 k: kkkkkkkkkfkkkzk", "1-3 n: nndn", "3-4 w: wwpf", "15-16 q: qqqqqqqqqqqqrqqqq", "3-4 w: wwcg", "10-12 r: rrrrrrrrrcrrrr",
  "10-11 v: fvlvrvcxvvp", "4-11 l: qdklwltggdcqn", "2-4 p: ppskptpp", "3-8 r: rjrrgrrk", "5-9 g: mgglggggrggggggxkggw", "9-16 n: njnnnnsnrnnnnnnhnnnn",
  "4-5 v: fgjvvxtqdmtqhnd", "2-11 r: rrfbltcxmqm", "4-7 q: hdkqfsq", "2-4 s: smshsswsztsmgssssss", "8-9 m: mmmmmmmlwm", "2-9 x: xxxxxxxxpxxxxxx",
  "3-4 d: zdgddd", "16-18 q: qqqqqqqqqqqqqqqbqj", "2-12 s: ssssmssssssssss", "8-9 q: dnztqqjqq", "1-3 d: ddddddddd", "2-10 h: hhhhhnhhvhhbhhhhhh",
  "8-11 l: wpjmvxqlmqllprw", "3-14 w: wwwwwwhwwwwwwpwwwwwf", "2-3 m: dlggmnlr", "1-6 b: bbbbblbbbbb", "1-10 c: ccbhdccdhltc", "2-11 g: cgrggfsgggggj",
  "10-15 t: ksnnwcqxcpzsvtcvtwm", "6-7 s: ssssssps", "17-18 j: wpjjjjjjjmjjjjcjjj", "7-8 m: cmqmmmlz", "3-4 m: mqmm", "3-10 h: dfhkkztbmhvcjvh",
  "7-16 x: rqwfvspqcxmpxnwxbd", "2-4 b: wfbbbfnj", "1-3 j: jjjj", "7-8 m: mmmmmmtw", "14-15 p: kpppwppppppppdppqp", "7-19 d: dddqrdkcgxxxdddddrdc",
  "1-6 l: cnlgtlc", "2-6 f: nfffffvfffqfrf", "11-15 s: sssssswsscsqbjdss", "6-14 s: sssfsssmsssssbsrnsh", "6-7 c: fcnppcc", "4-14 n: rshnnldbsnwvnwnnqnwn",
  "2-4 c: lcccrghcqwvc", "9-15 b: bgvjbclttvbqprb", "5-10 l: hlllqldgllnpttxqllrl", "8-18 h: hbhjknpnhvhpsbvsrdmh", "5-9 d: dddddddddd", "6-7 x: xxxxxxqd",
  "6-17 x: xntqxxxxxxxxxnwqnn", "10-19 f: fffjfffzfflhnfrsffq", "5-8 b: bbjfzdbhbb", "2-3 j: jljl", "16-17 s: swvsvsszsshssksssrn", "3-8 t: vtmhjrbx",
  "7-11 p: kpppppppppppppp", "3-4 j: wjjjk", "9-10 b: lbbpbbbbvb", "4-9 l: jrlbmrthlbjlmpgf", "5-7 g: vggggbwxgslgj", "11-17 f: gfmjfffdzfmvffpqff",
  "6-11 t: nbbbttmhbtwt", "6-7 p: jpprgnspppf", "6-7 w: wwwwwjwq", "8-11 g: zggggggchglqgggg", "15-16 x: xcxxxxbbxxxxxxxb", "2-16 d: xmnpfhvqnxcqdrgcw",
  "8-9 d: fdskddfwlddb", "3-9 x: xxxxxxxxs", "2-6 p: pppppbppps", "3-6 t: bjtptj", "18-19 w: qwwwwwwwwwwwwwwwwwww", "6-15 n: nkfndnxwzfjsvhnp",
  "3-4 v: lnvv", "7-13 v: mvvvvvbbvvvvmvv", "4-6 d: ddddds", "4-8 b: ftpbnfbsblvbvhlhtlb", "3-4 g: fnkf", "1-4 x: xxxw",
  "1-8 r: rrrbxnsrqrrrrqrr", "13-14 z: zzzzcvzzzzzzzzzz", "4-9 x: zhtvxfbzxdvkn", "1-9 d: zdddddddddd", "10-12 g: lhhddwgnjjwz", "6-12 p: ptpwlppsrzphlppqpd",
  "11-16 f: pfnxnbsfbsfdbzrx", "11-14 r: mccfwbcpbhrrlnvn", "10-14 w: wnwwwswtwwkwnw", "14-17 k: kkkkkkkkkkkwkwkkk", "7-9 g: kgkjktghg", "1-4 x: mxpxbjxxtvmw",
  "2-6 z: zzsswzr", "2-8 g: mcktgkkgqmcn", "8-19 n: znjnwhhnnwfdnhncwjdw", "3-4 k: pkgljmkdfhsxhpvwc", "7-13 m: mkpmmmqnmkmjrmcmm", "2-3 w: wvwcwxr",
  "19-20 q: qqqqqqqqqqqdqqqqqqmq", "5-6 r: rkqcrhs", "4-6 b: bbbbbq", "3-11 d: ddgddddddddd", "15-20 m: mmmmxmmbmrmmmfmmmmmm", "3-4 q: qhwq",
  "15-16 n: plzwngnnvzcnwknn", "4-11 l: ghlswpdrqvlsfj", "3-13 m: xdmvpmhktsmfm", "4-7 b: bbbbbbbbb", "4-10 w: mwwwgmgtwnwpbnw", "7-9 l: llllllpvlll",
  "3-11 z: zzdzzzzzzzzz", "3-4 h: hpnkhtz", "18-19 b: bbbbbbbbbbbbbbbbbbdb", "5-11 q: tqqqqbcqqqqdhq", "4-8 g: sgtgglgpgwjjj", "10-12 d: ddddddtkdcdr",
  "7-8 h: hhmhhhhh", "2-9 h: hrhvhhxhxghghh", "5-6 x: vxxxrh", "3-5 n: cgnfn", "17-18 z: bzzzzxtzcxzjvzzlzbn", "10-13 f: nfxwjfffffpfvffbvff",
  "1-3 p: pxpppp", "1-3 g: gqgbg", "9-10 v: vhfpwvvbvvfvvv", "3-7 r: rrsjrffrvwrrrr", "3-10 g: qlrrgglblwpjqccmw", "13-14 x: xxxxxxxxxxqxxx",
  "4-12 h: xrbkrnxjghkp", "13-14 s: xhsssswkssrsls", "6-8 r: rrrpgrrgrzr", "12-15 m: cmmmmmmmmmmmpmx", "2-8 l: wccfwrxl", "1-13 f: ffdfpdffffffffff",
  "10-12 d: dxdddddddddj", "9-18 b: ltnbbbmrfqbbbfbbgnd", "2-4 k: kbkklk", "7-8 n: nqmdncklnqnftjpvrcj", "6-7 s: ssssszshsss", "5-8 t: tttttsttttt",
  "11-19 k: hkvrktkkkkthrkvkkkkf", "3-5 x: qrxxbx", "11-12 d: ddddddddddzgd", "7-18 d: ndszddkddsdbdcqdddp", "7-8 t: ttttttttt", "2-4 s: gsksqskhjb",
  "9-13 d: dlqxsdddjdddg", "2-6 n: fgndtf", "6-11 s: sssssssnbsvss", "4-10 p: kjtpbjwpmb", "12-13 s: wssssssplsstscsszsds", "2-4 h: jthg",
  "1-2 z: zzzszhzzrvqz", "8-9 j: jjjjbjjncjj", "3-11 q: qvlqqqqqqqfqqqqqqqq", "8-15 w: pfqmwwwwqsccwgllm", "1-4 q: nqqhq", "7-16 k: kkkbktkkkjzhlkkkf",
  "4-11 s: kzjssthfsbtndfsd", "1-13 g: gbggljgggggggngggk", "1-9 q: qqqxlqvsmqg", "17-18 g: ggggggggggggggggfgg", "6-8 n: nnnnfsnrzksn", "2-4 k: zkhk",
  "10-12 n: gnfnnkknnnmnp", "1-3 j: jxnxw", "5-6 n: nbnknsjkmnh", "3-4 f: mkhf", "11-14 f: ptnpgkfzgzgxpk", "3-4 g: gwdj",
  "2-4 h: hhkh", "4-5 b: fvbzqx", "1-4 x: fxxp", "4-13 c: cccckcmtcccdccrcccc", "1-7 r: rrrrrrnrr", "9-12 g: rdhzhbspgxgccmmggg",
  "4-6 f: smfndrpscf", "2-6 j: jjjjjjj", "4-5 d: dddnzdd", "2-5 b: rbwgd", "4-6 s: sssssss", "3-6 d: dvnmjd",
  "10-14 x: xxxxxxxxxsxxxxx", "3-5 t: swttxctxf", "3-20 m: pxmlmzwzmjmnmnmcmmmr", "3-4 l: gdll", "9-13 h: kmhhhnznshhhhhsmhfx", "6-9 d: ghdlqfdmthdsjdcjht",
  "9-10 j: jdbqjjjjjjdjj", "4-7 q: qqvhbnqzxt", "5-18 b: mblpnblwlxjbxhqcmbl", "6-9 j: hjcwsvdgq", "9-16 t: kbtdksjcmmqpngdm", "6-9 z: zzzzzzzzzgzzzkzz",
  "18-19 x: xxfrxrgbbxpxxxxxxxqx", "4-5 b: nhbbz", "9-11 w: whwwwwhwwhwwww", "2-3 w: whww", "3-4 s: bsfsdgs", "5-7 k: kkkkhkwk",
  "5-9 f: ffxfffffqf", "4-5 z: bzzzggzjr", "14-17 n: nhjnxnnwxwvxnnlnv", "6-7 p: xpsklmg", "1-6 b: rbvblrkcblbbbb", "3-10 k: kkxkkkkkkck",
  "2-7 x: wxxdxgxtxqxxqxxxxx", "3-6 k: kwkfkznkkkq", "10-14 k: klqkksvskjkzmkkk", "2-6 p: wprgppgppszh", "4-5 b: bbbgbk", "8-16 b: kblbbbpvmjpbbfhhgbb",
  "6-7 g: hgdglzg", "3-7 g: lcgtgvl", "1-4 s: cssxs", "11-14 m: mhdpbnxqtpvfck", "11-20 b: bbbbbbbbkbnbbbwrbbbb", "1-3 l: lpcthzrgmmplrlxnbnw",
  "2-4 l: lbls", "11-12 h: thhhwhhhhhbf", "1-8 h: hhnlnhrc", "2-3 r: frpl", "8-12 p: ppppppkppnfpnspp", "6-14 f: fffffffcgrffffffk",
  "11-13 n: knnkrnkhvnvhsnhjmfb", "1-3 m: jmhjkk", "3-10 g: ggggggggggggggggggg", "6-8 m: mmhmmrtzrbgs", "14-15 c: nnvzfcvcrqcxbcw", "1-5 j: jjjjz",
  "1-15 r: rzjdmjjlfrbrmrrwlrr", "4-11 j: jjzfjjljnjjjjpj", "2-3 h: hhdh", "4-10 p: rppwqpppppp", "2-6 q: qqmwmqq", "10-19 t: dhjttjkspttxzbtxjmx",
  "10-11 r: rrhtjkdrrjl", "3-4 w: wwxwf", "4-17 n: ncsnlnnnnqnnnjnnqbc", "3-10 b: bnknbwbbbbb", "10-13 v: vvsfvjltvbwvvvnzv", "12-18 w: wwwwwwwnwwwfwwwwwww",
  "2-14 w: dwbmkgmqbqlcpwv", "1-9 r: rrrrrrrrkr", "1-5 f: ffflffffffff", "11-13 f: ftffffffffffgfff", "1-7 r: rwrrrrrrrr", "7-13 x: jthgxdmdxrbmvf",
  "5-6 r: wqdtqzrt", "4-13 d: kccfgmvknwbddrxmx", "9-18 x: xxxxxxxxcxxxxxxxxxx", "9-10 h: hhhhhhhvhhh", "8-16 v: gpblbxmvzhdrnjbrv", "6-10 t: ttttttttttttttttt",
  "5-9 k: slkkdtvhk", "4-5 f: ffpjq", "7-16 t: tktttttttttgtttttt", "4-7 k: kkkjkkdb", "3-4 q: qmvq", "2-7 b: whmfplbb",
  "16-17 p: pppppppppppppppppp", "5-7 h: hwphhngh", "4-5 w: kfjwlwcbhgz", "5-6 p: pxhppps", "17-18 k: pkmgdkdkckkvlrtnzj", "12-14 z: dkzzzzzztkmjzh",
  "6-9 d: ddddddddddjddddd", "1-6 v: vvvmvznvvbv", "1-8 b: bltbdzjb", "8-9 v: vvxvhvbvl", "8-15 m: mmmmmmmmmmmmmmvmm", "12-14 k: kkkkzkkkkkkkkk",
  "13-15 j: jjjjjjjjjjjjjsnj", "3-6 r: rrmrrrrr", "4-13 q: pqdrqqqqfhcqq", "2-7 b: lbzbkpbgvb", "5-9 h: hhmhrhhhhhhh", "4-5 h: hhfhb",
  "1-2 f: rfcjf", "4-12 f: gcffrbpvcnhvcrrj", "5-6 q: qcqrgs", "10-14 l: xcflwdwgbrqjwl", "13-16 v: qkvxzcltfsvmzgxqvt", "7-9 g: gggggggggg",
  "17-18 c: ccbqmccwcccfccgccc", "2-6 k: lkkkkwkk", "3-12 v: rqvqkhwxsrvv", "9-10 s: ssssqsksssss", "5-6 j: jjjjzj", "6-7 m: jnvpssgqtczz",
  "2-15 d: hdjhrksnlsbxdjdwvf", "11-18 m: mmmmmmmmmmzmmmmmmmmm", "5-6 m: mrdjgl", "3-10 h: xthspkwhjhltlcrds", "2-15 p: pbpppppdpppppppppkpp", "1-5 n: nznwn",
  "8-14 h: zghhhhghkzhllj", "15-19 v: vvvvvvvvhvvvxvvvvvg", "3-5 p: ppzpsbpp", "2-5 b: bwkdrdpkrtjdv", "8-12 x: qlxxxxvxxxsxgx", "2-10 z: zzzzzzzzzz",
  "2-13 w: bfvwhwwwpwbwwm", "8-10 p: pppppxpppc", "13-14 h: hthhhhhhthhhhzh", "5-7 l: llllccw", "3-4 w: wwww", "2-14 m: mnmmmmmmmmmmmgm",
  "2-5 j: jjjzbjj", "1-4 r: xrrwr", "6-12 f: fphbffwmffnzf", "1-5 z: pzkszsjzkdqxgzknrd", "5-10 b: bbbbbkbbkb", "9-11 d: dxrpkjhrddl",
  "5-11 n: bnlnnhqjbbn", "10-15 g: gggggggggwggggbggg", "4-9 q: jqqmqdqxfq", "6-9 q: lfcbxpqgqc", "7-13 j: jdcjjmjwfrjnnr", "1-13 g: xgggggggggggcggg",
  "10-11 d: ddvdxdmdddk", "4-6 n: nnnxnt", "5-7 n: hnjnnfnfpnrdntrh", "3-8 b: bgbrffxlbrbbb", "9-13 z: fdhdzzznzxzgj", "2-7 r: rqrgblk",
  "10-14 j: jxkjpjbjjjjjjsggjpp", "3-4 m: mmmm", "5-6 m: mmmmmmmm", "3-8 k: lvkvqcgkzkdcptc", "7-13 g: glbnggkbzkghgmg", "5-8 d: dddddddcd",
  "4-5 l: llllh", "5-15 w: wrwwwwwwwwwwwwwwqwww", "14-16 p: ppzppppptdpppsppppp", "8-12 p: ppxpppvppppkk", "15-17 x: xxkxxrkxxxxfpxxxx", "12-15 s: ssssscsssvssssgcs",
  "4-6 p: pppppp", "3-4 j: gjjjjwwj", "3-5 f: mfwhfpk", "16-18 p: pppppppppppppppxpmp", "1-2 m: mnmcrmq", "10-19 t: bttttttbtttttttttttt",
  "1-13 z: qzzzzzzzzzzzzz", "11-17 w: zpdsdfmhgmvcvzkdwpw", "5-7 z: zzzlfzgzz", "8-15 d: dddddddpddrdqgt", "2-3 k: nkjkk", "11-12 q: qmqqqqqqqgnnfqkqc",
  "1-2 p: pgpp", "5-6 b: fnbzbb", "11-12 z: zpzzczkzzrpszzzzt", "13-14 t: ttttttttttwttqtt", "4-6 p: phpfpp", "2-3 f: fvfws",
  "6-7 f: fffflfdff", "8-9 q: cwpqcqzqpf", "5-7 p: spppjpkpc", "4-11 s: sgsssdbbhpkssd", "1-6 s: wsssspsfsss", "1-3 m: mdmmmmmm",
  "4-6 d: dtdtmdg", "1-3 w: wwzwpww", "10-11 l: tlmhlllnqllb", "12-17 m: mmmmmmmmzmmtwmmmg", "3-4 c: cctkcc", "13-14 b: bsbbbbbbbbbbglb",
  "6-7 w: wwwwwxd", "1-11 j: kjjjxkjjrqj", "5-8 z: zbvjzzzz", "1-5 k: gkbktk", "11-13 k: kkkkkzpmkkkkm", "10-11 z: wtpfvmmpqhg",
  "2-3 s: bssc", "8-17 h: hhhhhhhxhhhhhhhjhh", "6-9 l: lllllmllll", "5-9 l: llllllglll", "2-7 q: qkqdsqm", "6-8 s: ssssssjtds",
  "7-8 c: ctfdfmccjhvrc", "4-5 w: gqcdwcwktmm", "4-13 b: wwjbnmghbjkwzbbj", "1-9 r: qbprwrrmsrr", "3-4 c: kcscl", "3-4 d: jdqd",
  "2-7 p: xpzmbfpvpjg", "2-4 f: fnfq", "7-8 b: wjdqkbbb", "13-15 m: mmmmmmpmmfmmgmxmmmm", "4-5 c: mpclj", "9-10 x: txxxxdpxql",
  "1-5 c: gccjcc", "2-8 k: xzkqkhvk", "9-11 k: kkkkckkkgkkpkvk", "10-14 x: mxzxrkdxgpxcxhxl", "5-6 z: hzzztz", "10-13 g: wzgggggvgggkl",
  "2-5 p: mmpvk", "2-4 b: stbsbbbbbb", "9-10 r: rrrgrrrrwqr", "1-6 z: xzzfzzv", "3-5 l: ljvlw", "2-8 f: lfqvjghd",
  "4-5 n: nnznn", "5-16 r: csmxrkrqnwnzzpprvr", "2-15 h: qhtmxhbgzzsbnjwwsqfl", "4-5 s: sfqps", "4-5 c: cqcgc", "12-13 d: dmcddddddddcdd",
  "3-4 s: xsqs", "14-15 j: jjjjjjjhjjjjjjj", "12-13 r: rcrsrrrrrrrrrrrr", "9-10 h: hhhfxjzvhxhbf", "3-5 w: qwvww", "4-9 b: bbbfbbbblbb",
  "15-17 b: kdlqpsrbrbbmbbbzbtz", "9-10 p: ppqppjppwjpp", "11-14 x: mbchwxxxxxxxxf", "2-3 t: stdnsv", "2-4 s: sbss", "7-9 k: kvkfkkqjk",
  "5-6 d: ddddldd", "1-12 g: cggggggggggqgggg", "8-10 b: bcvxgdzbbbbclbddmcpq", "1-3 p: qpppp", "3-10 g: mbggbzlwjgrqncddkbjz", "3-6 n: nnnnnnnnnnnn",
  "5-14 t: fdtqxdpztgrtzl", "7-9 p: ndppppzpppnb", "6-9 l: llxlmlldltllll", "2-8 p: pwvmbccpvhbqg", "2-5 q: bqccqlpj", "1-12 j: jjpddhjrjkjb",
  "2-16 j: hnmrxjcspnnrqhcj", "2-4 s: scrb", "3-11 j: jjjjjjjwjjc", "6-9 h: bhlsnhkfhnqhprpdm", "2-4 k: skcn", "10-15 r: prrbrrnrrrrrrvlrhr",
  "1-2 p: pppp", "3-5 t: ttqtttc", "1-2 k: kwkp", "6-7 g: gggggggfxgmgggggwg", "6-17 g: lvgggggnrwqnsggrgg", "2-8 v: qvmnvvvzn",
  "5-6 r: rrcmgrvrhrf", "6-7 w: cwwhwwq", "1-16 l: rllllllllllllllll", "14-16 v: vvvvvvvmvvvvvqvvvhv", "13-16 m: qmmmmmmmmmdmmmghmmmm", "10-13 x: xgxxbtbxgxxxdx",
  "6-7 k: kkvkqkwkkkkvkkkh", "16-18 g: ggggggggggggggggggg", "1-12 f: ffffffffffsmffn", "11-14 c: kmltgplwdccvzchtfs", "1-2 l: whll", "3-10 r: tchrjqrwnrnhlrzssdr",
  "1-4 b: jbxbrb", "9-10 d: dddddddddldd", "4-6 r: rwrrrrrlrchnqxv", "1-5 z: sjznb", "3-4 p: wqtp", "3-13 n: zncsfbdxpnpzn",
  "6-8 b: ppbzbvjhmfnq", "2-4 h: hhhr", "5-6 w: lwrgll", "10-15 l: lllllllllllllllll", "5-6 l: hltlllbwlr", "8-9 q: tpzqmqqssqqqqq",
  "12-17 v: bmxhqtvmrgvvgqzvp", "7-8 t: ttttttvtt", "11-12 r: rrbrrvrrnsrr", "2-5 f: wzrnlcxfhnchsrzjxl", "12-17 l: lllllllllrllllldl", "9-10 h: phhhhhhhrzhq",
  "5-17 q: chqkqpjqnqjlcvbxlqkq", "1-2 m: hbmm", "4-10 f: vtfffsbvsff", "5-10 h: hhhhhhhphnhhh", "2-3 x: xlxxxnxltdxbxdbxpg", "4-12 x: nlxxtcbbbknh",
  "2-3 l: llfll", "6-9 p: ppppppppp", "2-4 v: grwdv", "5-8 c: fkpkccdcvdvck", "2-8 l: khzlpwdcddk", "2-7 v: vlbvvbl",
  "7-8 h: zhhhhhnh", "12-14 p: phpxppkprhbpvpp", "5-6 j: jjjjcsj", "5-12 m: srctztgnwtrmmmwkjk", "5-6 s: ssslss", "2-3 m: mxmm",
  "10-13 c: ccccdcdcccchzlcw", "11-12 k: kkkwkkkkkkkkkk", "9-11 g: rfggsgphdhg", "8-13 w: wwxwwwzwfwwwtlww", "5-6 f: qvpfmt", "12-13 n: mlnntnnzblnnvnd",
  "7-8 q: qqqqqqbqqq", "4-7 p: hpnvfpmpgqp", "14-16 b: bbbxbbbbbbbbbtbdbvb", "16-19 g: gwgggcsgggpggjgjggj", "3-6 k: kkkptkkdrk", "1-7 l: slsrxllllw",
  "3-12 d: dddddddddddqdd", "5-6 m: vcwtmdmmmmxzm", "4-6 r: rtcfcz", "7-12 x: xxswxxhjxnxxxx", "6-7 t: ttswtkztt", "15-18 g: nggckgdmsvdrqlgcqz",
  "6-9 t: tttttstttlt", "16-20 f: fffffffffffffffffffl", "7-10 l: bcbdhwlslwlqx", "8-11 k: kkkmkkvksmktkskkxkmk", "9-15 h: rptgwtvxjgzqjrtqqc", "4-6 j: jjjjjjjjjj",
  "12-15 w: wwwwwwxwwwfwwxrw", "13-15 d: ddddddddmdcdcddddd", "13-14 v: vvvvvvvvvvvtxv", "10-12 f: fffffffffffvf", "7-10 j: jjlftzjmjz", "9-10 w: cwwzwwllwfwktqkwxr",
  "1-8 b: bbbbbbbvb", "11-14 d: dlsmbgcdxhxfnqdhzd", "17-18 k: kkkkkkkkkkkkktkkbq", "7-8 k: kfkpkkkkkk", "4-9 w: zbwwwrckwntbdqfd", "7-8 m: mmmwmmgm",
  "7-11 v: cvxllpvgdnh", "5-13 c: cmccqccjcccjc", "12-14 m: mmmmmmmmmmmmmvmmmp", "4-11 x: dgvxxptdgkxpxl", "4-5 f: pfclfffk", "7-14 l: lllwlwlqqsnmllllll",
  "10-11 l: pcqllllvlqlll", "2-5 k: kkbkk", "3-6 d: ddddddd", "8-9 d: dddddddld", "1-11 d: tddddddcddmdddd", "5-8 b: pljtbkwkxb",
  "11-12 t: tttttttktttgttt", "6-7 q: qtqqqqgq", "7-8 v: vvvbvpxp", "4-13 v: vvvpvrzvvvvvvvvvv", "8-11 r: rrrrrrrnrrr", "14-15 b: bbbbbbbbbbbbbzr",
  "13-16 p: ppppppppppppfpppp", "7-10 g: gfgqgglggg", "4-7 s: ssdsshc", "8-11 t: zttctgtvttfttcrxd", "11-12 j: jjjjjjjjjqwx", "1-6 w: wwwwwl",
  "4-7 l: zlbmrll", "2-10 k: kkkkkkkkkm", "8-10 x: xxxxxxxjxfx", "4-13 r: blrrkqjczlbnrfbbkd", "8-10 z: zzzzlzzzhj", "9-11 s: vsmsszsssvsqss",
  "3-6 m: mvkrmmwpzbtmmm", "1-5 r: smlrbr", "5-6 k: rlkklkkkkh", "2-5 d: dkddddddpd", "13-14 g: ggxtggfvgggdgggggcgg", "7-9 x: xxxxxxbxgxxx",
  "3-16 x: xxxxxxxxxxxxxxxlxx", "11-15 c: chvcccccccqccdm", "3-4 j: kjjjj", "9-10 d: ddddmddddd", "13-14 q: lqqbrqzbqqpcpt", "2-5 w: xgjsxww",
  "12-14 w: lwtxgwwzwlwbwwc", "3-4 r: hffl", "11-15 b: bbbbbbbbbbfbbbwb", "3-7 f: lffnkpfm", "6-13 v: vvvvvcvvvvvvvv", "7-11 v: vvvhmvvvjvvvvvvvh",
  "18-19 z: bzqtbfvfkxgzzxkftzz", "8-14 l: gptlllllllxgll", "7-10 w: dwmwrfwkkghf", "2-4 f: fffshfffff", "1-3 n: rnsfgn", "7-20 w: wwwwwwhwwwwwwwwwwwwg",
  "11-14 g: ggggggggggwggggkgg", "2-8 x: xtxxlxxmmcxllxtxwxx", "2-8 b: jbfclqjbkszckpkxnbn", "1-3 d: dhdhffmd", "14-19 b: bbbbbbbbbbbbbbbjbbbb", "6-8 d: dtjbzdsddddf",
  "14-16 n: rfmszmgztspnnncqj", "9-10 v: vvvvrvvvvnv", "5-6 r: rrsrrrrrrr", "6-7 v: vvjvvjrv", "6-8 q: tvqsqqvqqd", "1-3 q: qwtdqbgmmck",
  "8-15 p: ppppqppzjpppplpppppp", "6-12 m: mwmhmsjxgcmmcrzlmmkc", "2-8 j: sjwjljqjjjcdlmgxkjj", "12-15 j: sjjjjjjqjjjjjjkjjj", "14-15 t: vtttttttttttttt", "17-18 r: rrrrrrrrrrrrrprrhd", "10-15 c: sxspsvqkfvqjjccxbbv", "7-8 g: ggggggxg", "2-12 t: tbtttttttntmttttt", "3-6 m: ztjrds", "2-4 h: gdzk",
  "4-5 p: rtlkkfwntpxw", "8-14 k: kkkkkckkkkkkkgkkk", "3-8 l: rqltzlflljsqmk", "9-10 s: smssswksjsssss", "12-13 z: zzzzzzzzzzzzr", "12-14 h: zhhhqvhhhhxhhh",
  "13-14 x: xxxxxxxfsxqqsxxxx", "2-3 k: kffk", "1-5 z: jzzzzzzz", "10-15 n: nngnnhnjnnknndnvtbsd", "12-13 k: dkkkkkkkkkkkn", "6-8 h: qhfnrpfh",
  "7-11 c: ccccccqccccc", "19-20 m: cjbpwtmdfbllvvdrmmmt", "5-6 l: lmrbhtbl", "3-6 j: hjjkjm", "9-10 j: jjjjjjjjtljxjj", "3-5 t: ttbtcttt",
  "5-8 r: rrrrrwhfrrf", "3-5 d: dqvknd", "5-7 j: jtjjgjm", "5-7 v: vdjrlwv", "8-9 s: ssssqsssssssxssssss", "12-16 q: qxkjsjlsggcqhplq",
  "16-17 j: jbftlzjjhjjjjvhjjj", "3-14 v: gppvmdbvfwvgnd", "1-8 b: bbbbbbbdb", "2-6 z: pzwhjdzpxwt", "5-9 v: qvrvmdvhwv", "2-3 b: bbhlpxtbxzx",
  "4-5 z: zzhpzz", "15-20 f: fgzfnbcgtbnmflffqfrv", "4-5 t: ztxttc", "6-11 p: mjppkpcrdflpwqjrwprp", "4-7 h: khdwwhhrhhnchs", "10-11 b: mprbbblmcbbxqbbbbc",
  "4-6 c: cccjcccx", "1-4 r: nrrhrrr", "1-2 d: dddlk", "19-20 f: bfffffffffffffffffkb", "4-6 w: wlswkwwrdsjtwbww", "2-3 d: ddld",
  "9-14 r: rrrrrrrrmrgrrjrrr", "10-11 k: kkqkkkkkkjk", "2-5 k: rkkkkxkkkvsd", "16-17 b: bbbjbbbbbbbblbbbrbb", "6-7 k: kkkkkkk", "7-11 v: lfpjgrrvchvjfdt",
  "12-13 g: fgxqnkgstgpggvrqdl", "11-13 d: ddmmdtdddddhddd", "6-7 g: mpstgwggbx", "11-14 h: hhhhhhhhhhqhhbh", "18-20 d: dddddmdddddddddddddh", "10-12 m: mmmmqmmmmmrxwmmq",
  "2-13 d: rxnxstxxrjvbdd", "3-4 z: drzlrz", "5-6 d: qddddb", "3-7 d: ddzjcmvtkfdjplhllfn", "10-15 m: wdxhmwbnmmmtrxpcj", "7-8 b: bbkjbbgnbbswd",
  "2-3 b: bbbhz", "1-10 p: gpppqpppgppppppp", "10-11 w: zwwfbwdqzww", "10-11 n: nnnnnnncnknn", "9-13 n: nnnnnnnnnnnnnndnnn", "6-10 f: fffffbfffhf",
  "3-5 h: cmhtc", "1-2 p: gzpsj", "4-10 w: wjwhwwwwwvwww", "2-13 g: kwpjkxkjmhgnpsmjsmd", "3-4 c: cctpj", "13-15 k: kvkzkkskqkkkmkdkkkk",
  "8-9 x: qnxxxfbdx", "10-15 k: rkkbkvckkknxlmb", "7-8 l: llcqslvlljgll", "2-4 b: dtgbb", "9-11 j: sjrkthwqjjq", "1-4 z: bpzxzvjzrwhtpccm",
  "8-9 n: nnvnnwwnnlnnnznnnn", "5-7 j: sthpjjpwrt", "12-13 s: ssssssssssssn", "3-4 m: mnmgf", "7-13 p: pppppprppppppfppppp", "6-8 h: zhhbwhht",
  "13-16 t: ttdtttttttttctkt", "8-9 l: lllnhlllzpjlqllzld", "7-15 x: fpkxzbbnxlcxxlxvx", "3-10 b: bbbbbbbbbk", "3-4 z: zzrg", "1-4 w: wxww",
  "5-6 b: dbbbwbb", "2-3 r: frrhnh", "1-11 d: qqsrfdddxdzdg", "5-7 z: zzzhzzxz", "5-6 b: slsbbb", "1-2 b: jsbbg",
  "2-10 t: tzttmtpwttttttm", "4-5 n: kngxn", "5-8 d: tpndxhvd", "4-5 z: zgzbzzg", "5-15 s: ssssssssssssssls", "2-10 g: ggjgcglgggt",
  "15-16 w: wwwwwwwwrwwwwwvzwwg", "1-4 s: mksm", "1-3 q: qqjqq", "4-5 p: kwpkg", "7-19 z: pkqkkzzzqccnlpzgzzz", "4-6 k: kkkfkc",
  "3-11 h: khshhhnnzphc", "3-9 h: tkhghdhkhbhgx", "4-8 n: kzntlxwn", "1-2 v: xvkmv", "3-5 m: mmmmkm", "2-7 q: qqbwwctqbqs",
  "2-3 m: mmmm", "1-5 k: kkkkk", "5-10 t: tttttttttbtxttt", "1-4 l: lllblllllllllllll", "11-12 c: cccccccccccwc", "7-12 f: bfvpqzgwjxrnffjzm",
  "1-13 k: kkkkkrkkkkkkkhk", "1-2 w: pcwwwb", "6-11 j: jjqjjnbznjt", "3-4 d: vzdn", "3-5 f: ffhkc", "6-9 t: fbttjbtttlzdktf",
  "1-8 k: rrkkkkkb", "4-7 f: kbvdphfjgkdthtvffh", "1-5 c: hgtcjnjqf", "7-11 f: zfffffljfffffffg", "3-6 j: jrjjjsjjj", "7-14 r: rrrzrrrpjxrtrrrrrr",
  "2-6 d: tdvbjdzqj", "11-12 l: zbfnlfzlllls", "2-5 c: cjccnf", "6-8 v: vvvvfvvvv", "9-10 b: bbbbbbbbbbbbt", "10-12 l: llllllldlllh",
  "8-13 g: sggzgggjggggjgggqz", "8-12 m: mmsmmrmmgmmgmmmfhmmz", "2-4 m: mqsmhnm", "2-3 j: jjljjj", "6-15 w: wrwwwkwfwzwnjcwwwjhh", "5-6 p: cbppwb",
  "1-10 h: xhhhhhhhhvhhk", "6-14 c: dccccvfcmlcxgcccc", "2-7 r: cmxrrrcmrr", "13-16 f: ffffffffffffcfft", "4-5 s: rsbzssssp", "8-10 j: jjzjjjjxjpj",
  "3-12 n: nnnnnnnnnjnnn", "13-14 g: gggggggghggggjg", "10-11 s: tzssqhxrsss", "2-12 l: lllllwdlltvlblxlln", "11-18 n: wwnnnnvnhnvnnnntnpn", "5-6 h: khkhhhhhzfhdxkqmk",
  "1-4 z: czqrzzzzz", "11-13 f: ffffffffffffcf", "1-3 x: pxxx", "2-5 t: tttttttt", "4-5 d: ddddld", "1-3 c: chcsck",
  "8-11 d: dddddddkddzd", "9-14 n: nnnwwnnnnnnnntn", "1-2 t: tftqt", "6-7 d: hdtncds", "3-9 r: lbrrkmrmrw", "9-10 w: wgwwwwwwww",
  "2-3 j: jjgcqjjj", "7-8 q: cqqqqqqq", "4-12 x: xsvxsxsvlxxrqxx", "7-14 l: sldglzflqgddxwlvlc", "6-8 l: lllggcqlllll", "3-8 b: bfbqdlgbwjldng",
  "1-4 g: kgggggg", "3-8 n: lpnxplmnz", "11-17 g: ggggggggggpgggggmgg", "18-19 t: ttttgtttttttttttwrtt", "8-10 x: fxjxxwdsfqxwnpmvxf", "11-12 d: ddddddddddvj",
  "4-7 n: qpnbgnnw", "5-7 x: xfkrxfxk", "6-13 r: rrrstrrgvdvrrrnm", "4-5 m: zfmmr", "5-12 r: rbrrcrrrrrrrrrrrm", "12-13 l: lllllllllxllzl",
  "6-9 x: xxxxxrxxsx", "5-6 v: vxtdvvgvwlqfwtbsvnvv", "1-2 j: qdtcpqrltjgppjvc", "3-5 v: vvjvcv", "1-5 f: ffffsfff", "2-3 k: xkkgmnnpkq",
  "12-19 m: gmmcwcmmnrfqmpmbmmr", "4-11 z: knzzmztfnnzzjszzjfz", "7-8 k: xkczkkkckk", "15-17 m: mmmmmvmmgmmmmmrmm", "5-7 s: xssssss", "12-16 n: nnnnnnnnnnnnnnnvn",
  "4-16 b: vbjbmgbplwltlcbw", "8-11 b: bgbbbbbdbbrb", "3-10 d: ddddddddddd", "8-14 k: kxpkkkkvvkkkzk", "3-6 l: llzllll", "16-17 d: tnjdmnddkddbdvvddddm",
  "5-9 h: bbchxhnhqk", "3-6 d: wpqdfl", "8-13 z: zzzqfkzhzzcmz", "3-13 q: qkrwstgphfrtq", "9-10 b: bbqtrtsbbb", "19-20 q: bbmkgtnsgzmqzqsrwcqd",
  "3-11 q: dtvgqqnwmgzs", "12-16 x: xxxxnxxxxxxqxxxxxxx", "10-16 p: vpmpppprxppmgppppqcq", "3-6 l: mxxlbllpwblzlllnl", "12-13 v: hvfvnjvgvvpvvjkvvj", "2-12 v: scqjdrlkfzrl",
  "5-6 l: lllllp", "4-5 g: pgsgg", "5-6 k: nkktsjgknkbz", "4-8 v: vfvvvvvvvvv", "6-11 k: ddcqknhhkck", "6-10 w: gwqpwwwwtfwv",
  "2-9 q: qlkqkkqqqlchq", "8-15 n: ghsnnndhlxpjwnqsnnp", "6-7 l: lllllllll", "2-5 x: xxtcx", "6-10 x: lwtcqxjxvxxhxpxxxsx", "2-4 t: lvglqt",
  "2-3 d: tfsq", "7-17 m: dxnmnwggnmdmrmhjh", "6-7 g: tgsvggdkmlpstg", "1-8 n: nbnzflml", "6-8 c: clccpclsp", "6-8 r: rrrrckrdkrrwzrr",
  "3-12 p: pplpppfppppppp", "2-4 c: fccc", "10-16 r: rgrrrrrrrdrrrrrrrqr", "2-6 x: xwxqxqx", "7-11 h: hwhhvhvrghrhnh", "7-11 z: mjjxrfhftbbbklzkv",
  "4-5 c: ccpcc", "9-17 z: qznzzcvzzjczzzjzzz", "18-19 z: zzzzzzzzzzzzzzzzzrz", "2-3 r: bdvzlrkjhjvqp", "16-19 d: dddddfdddqdddddddddq", "14-18 b: bbmbbbjbpbqtbdwbbb",
  "8-9 f: mfddqvlff", "7-10 x: xxxxtxkxxb", "4-5 r: hbvxthrwllx", "3-4 t: tltstng", "2-4 f: tfnrcgqf", "1-6 g: fgvbwg",
  "7-10 z: vzznzzbzzklzzzlzz", "10-13 j: jrwjqgjjzjmbklqxwjn", "1-5 s: sssssss", "8-11 v: xfpwhwvntgvht", "8-9 l: lllvsglzltllwhl", "7-20 n: jnnsnnknnncknnnrnjnn",
  "7-11 c: cvblgfxdzcccxjdclt", "8-12 t: tthstttktfttzmdtpk", "9-12 g: rggvkgnggggm", "5-8 f: jrfppdsnpjkwjrdhddf", "5-6 n: nnnnnwnn", "7-12 j: jjjjjjjjjcmkjj",
  "2-5 g: gbggkg", "5-16 p: ppgpnpppppppppprpp", "1-6 d: ddgddvdd", "3-11 s: sscsksssssldssss", "5-13 j: jjjjjjcjjjjkjjjjj", "9-13 m: mfmmmtvdcnwmmmmm",
  "2-3 f: fffrjn", "7-9 z: zzzzzzzzfzzqnzzz", "3-6 b: bbbbbbb", "6-8 v: dvxvqzvv", "4-5 h: hhhwhh", "1-2 w: wwwwwwwwwww",
  "6-11 h: shqlvhbqhbh", "6-7 d: dddrddtdd", "11-17 z: zzzzzzzzzzzzzzzzl", "6-7 t: ttttttttt", "2-3 j: zjstccxb", "11-13 q: qqqqfqqqqqqqsqp",
  "2-7 p: sppznwpjptppdppp", "3-4 m: mmml", "3-12 g: phkfggggkzgxbsxr", "1-2 c: ppcbvncvck", "12-18 h: kjmmtxkrjthtsphgsb", "13-16 n: nnnnnnnnnnnnwnnn",
  "11-16 s: xstpxfxtkgscbgws", "14-15 h: hkktqhhszldhhkh", "8-12 j: jjjjjjjjjjjdjjj", "13-14 k: phkkkmkkkkqkkrkkk", "4-5 h: hhhqqhhhn", "4-12 k: kkkkkkkkkrkkkk",
  "7-10 q: qqqqqqqqqbq", "5-7 s: szssqsgs", "8-11 l: lllllllllll", "10-11 w: tfbwwxwwmkp", "10-11 s: blkkznbrtss", "2-4 t: dtxt",
  "12-13 x: xxxxxlxtxxxfxxn", "9-15 v: mvvhvwnvgvvvvzc", "6-17 g: gbggfxvmlfjmgdmshfzq", "9-12 n: lqmsxjnnnwrqphn", "6-17 b: bbpljfjbsbgfzxgsn", "13-15 f: fjgfdsffphbcsltw",
  "3-8 g: kxjlsggg", "2-10 n: nfnhnnnnnknn", "2-6 x: xzxxxpx", "4-5 f: zddjhfknqffsbbf", "3-5 r: skxgqcrrrx", "1-2 x: rxcddx",
  "8-12 g: gggggggggggmgg", "1-6 j: jjjjddjj", "8-11 z: zzszznzfzzz", "3-14 s: hwjszphhcwjmhsssc", "5-7 m: lpcnpsr", "5-6 f: frffplfffff",
  "4-7 m: msmkrmw", "4-10 s: vhlztshrspskv", "13-14 q: mqqgqmcpqpdrqn", "5-9 h: hhhmrhhhh", "4-6 r: lbqhmw", "5-6 b: mbzhbsbbhthll",
  "13-16 v: vvvvvvvvvvvvhvvdvvvf", "10-12 w: wwmwgwwzwpwv", "2-12 b: kpxbpfbfbcjfbkcfxmbb", "14-17 n: nngnnnnfnqnnnnnnrn", "6-10 h: hchhhhqhhxhhzj", "5-6 h: hzvnwb",
  "7-8 p: pnhxqpls", "4-5 z: zzztzz", "11-12 c: fclcctjcfdqrcps", "6-15 v: jgclvvsqkqgjkvvcl", "1-13 j: wjjjjjjjjjjjgj", "6-7 f: fffffmfzpf",
  "6-12 p: kppppgppzpptphxp", "13-14 b: bbbbbbbbbbbbbbbb", "18-20 f: ffffffffffffffmxftfv", "6-11 k: gfkkkctxmkrkp", "1-9 r: rrwvbwdtr", "8-18 b: bbbbbbbtbbbbbbbbbbb",
  "3-10 t: ftqgcktpthttztm", "5-8 j: jjzjjjtjlbhj", "2-6 w: hwkljw", "10-14 g: kggggggfrrgggxgg", "7-13 z: zjszqzxzdzzzkjzf", "1-6 p: ppppppppp",
  "8-9 p: pppppdpgqpppp", "13-15 g: gggggpsggggtggbg", "4-5 g: gpmsg", "2-5 z: vzfhzzhphh", "2-4 g: jgzq", "8-9 g: pgjggbbgf",
  "3-4 r: ljsnp", "7-13 x: xxxxxgxxxkxxxxvxkkxm", "2-6 g: nggfgw", "9-10 m: mmmmmmmmldm", "15-16 w: wwwwhwkwjnwwwwdn", "10-18 r: rrrrrrrrrrrrrrrrrkr",
  "2-3 q: qplq", "1-7 m: tmmmmsq", "2-5 w: swwmwk", "2-3 l: slgkdtjznfxdml", "10-12 q: qxmmqjqqqqqw", "12-14 c: bhlhjcwkcndchwc",
  "10-11 d: dddddsddddl", "13-14 g: mxdxkmvcgrsqgn", "3-4 t: qtttpmt", "14-16 b: bbbbbbbbbbbbbbbqbbb", "2-11 w: zdggnxfnzpwnf", "6-7 r: rfrcrrf",
  "9-10 h: hhhhhhhhfg", "7-8 r: rrrrrrvl", "8-9 n: rnsnvlrqdq", "4-7 f: ffwnzdf", "15-18 x: ngxxvqwxzlhxwpxxxz", "13-15 w: nwwwwwqwwwwwtww"
].freeze

class ListValidator
  def initialize(validator, list)
    @count     = 0
    @validator = validator
    @list      = list
  end

  def run
    @list.each do |string|
      @count += 1 if @validator.new(string).valid?
    end

    puts @count
  end
end

class Password
  def initialize(string)
    @string   = string
    @min      = parse[:min].to_i
    @max      = parse[:max].to_i
    @letter   = parse[:letter]
    @password = parse[:password]
  end

  def valid?
    raise NotImplementedError
  end

  private

  def parse
    @parse ||= @string.match(/(?<min>.*)-(?<max>.*) (?<letter>.{1}): (?<password>.*)$/)
  end
end

class PartOnePassword < Password
  def valid?
    (@min..@max).cover?(letter_count)
  end

  private

  def letter_count
    @password.chars.select { |l| l == @letter }.count
  end
end

class PartTwoPassword < Password
  def valid?
    (first == @letter && second != @letter) ||
      (first != @letter && second == @letter)
  end

  private

  def first
    @first ||= @password[@min - 1]
  end

  def second
    @second ||= @password[@max - 1]
  end
end

ListValidator.new(PartOnePassword, LIST).run
ListValidator.new(PartTwoPassword, LIST).run
