# frozen_string_literal: true

input = <<~HERE
  PHVCVBFHCVPFKBNHKNBO

  HK -> F
  VN -> S
  NB -> F
  HF -> B
  CK -> N
  VP -> B
  HO -> P
  NH -> N
  CC -> N
  FC -> P
  OK -> S
  OO -> P
  ON -> C
  VF -> B
  NN -> O
  KS -> P
  FK -> K
  HB -> V
  SH -> O
  OB -> K
  PB -> V
  BO -> O
  NV -> K
  CV -> H
  PH -> H
  KO -> B
  BC -> B
  KC -> B
  SO -> P
  CF -> V
  VS -> F
  OV -> N
  NS -> K
  KV -> O
  OP -> O
  HH -> C
  FB -> S
  CO -> K
  SB -> K
  SN -> V
  OF -> F
  BN -> F
  CP -> C
  NC -> H
  VH -> S
  HV -> V
  NF -> B
  SS -> K
  FO -> F
  VO -> H
  KK -> C
  PF -> V
  OS -> F
  OC -> H
  SK -> V
  FF -> H
  PK -> N
  PC -> O
  SP -> B
  CB -> B
  CH -> H
  FN -> V
  SV -> O
  SC -> P
  NP -> B
  BB -> S
  PV -> S
  VB -> P
  SF -> H
  VC -> O
  HN -> V
  BF -> O
  NO -> O
  HP -> N
  VV -> K
  HS -> P
  FH -> N
  KB -> F
  KF -> B
  PN -> K
  KH -> K
  CN -> S
  PP -> O
  BP -> O
  OH -> B
  FS -> O
  BK -> B
  PO -> V
  CS -> C
  BV -> N
  KP -> O
  KN -> B
  VK -> F
  HC -> O
  BH -> B
  FP -> H
  NK -> V
  BS -> C
  FV -> F
  PS -> P
HERE

require "debug"

start, rules = input.split("\n\n")

rules = rules.scan(/(\w{2}) -> (\w)/)
             .map { |k, v| [k, "#{k[0]}#{v}#{k[1]}"] }
             .to_h

class Array
  def smoosh
    tmp = map { _1.slice(..1) }
    tmp[-1] = last

    tmp.join
  end
end

10.times { start = start.chars.each_cons(2).map { rules[_1 + _2] }.smoosh }

puts start.chars.tally.values.minmax.inject(:-).abs