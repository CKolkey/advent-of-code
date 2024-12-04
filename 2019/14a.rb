# frozen_string_literal: true

require 'debug'

INPUT = <<~IN
  3 NPNGZ, 3 TBFQ, 1 RZBF => 2 LQNR
  1 GWZRW => 9 CHNX
  1 DBVD, 10 VCHK, 12 WNHV, 1 FMKT, 1 DKFT, 1 BTLR, 12 VHKXD => 4 ZMWC
  2 RZBF, 13 JSBVZ => 3 JLVRS
  15 BZNB, 1 JSBVZ => 5 ZTCM
  28 GMSF, 18 LTGJ => 9 BTLR
  1 RZDM, 3 BNJD, 1 FLXL => 1 FDBX
  2 BZNB, 1 JLVRS => 2 GMSF
  1 FDBX, 2 ZSQR, 1 XMBS, 2 FMKT, 1 BNJD, 12 TRXVN => 7 CRNMW
  1 PCHWB, 6 LXJPK, 2 ZSQR => 5 DBVD
  5 LMTM, 9 RZBF => 7 TBFQ
  2 KVWJG => 2 RZBF
  1 LBFXF, 17 NRBGS => 6 JSBVZ
  1 VQTFW => 5 LMTM
  20 DBVD => 2 SRFQ
  3 XSVZ, 7 JSBVZ, 5 NPNGZ => 2 VWMQZ
  1 ZQDN, 1 RZBF, 1 NDNKB => 9 FMKT
  7 BZVGH, 9 NDNKB => 6 LTGJ
  3 VWMQZ, 1 XSVZ, 4 GKDGX => 1 TRXVN
  3 VXFJM, 14 FMKT => 6 NFTJ
  21 WXWHD => 1 VCHK
  1 TJZVQ => 6 NDNKB
  6 NFTJ => 3 RZDM
  1 VHKXD, 1 TBPWN, 1 FDBX, 2 XMBS, 2 WJTRC, 20 BTLR => 8 VSBV
  19 XSVZ, 7 LJQG, 10 ZTCM => 1 GKDGX
  3 NPNGZ, 2 RZBF, 8 GWZRW => 1 QVDFQ
  1 TBFQ => 7 VHKXD
  3 LTGJ, 1 ZXWB, 2 MNPBV => 2 BNJD
  9 LQNR, 2 QVDFQ, 10 GMSF => 4 XSVZ
  13 VHKXD, 17 CHNX, 1 NDNKB => 8 VXFJM
  122 ORE => 4 LBFXF
  18 NPNGZ => 5 LXJPK
  1 TJZVQ, 1 FXGH => 5 GWZRW
  9 BZNB, 4 JLVRS => 3 KDCG
  1 SNLNK => 8 WNHV
  4 VHKXD => 4 DGFN
  1 RZDM => 6 SNLNK
  3 CHNX, 8 LTGJ => 4 TBPWN
  2 DGFN, 1 NFTJ => 2 RNSXD
  1 FXGH, 1 BDCLW => 2 LJQG
  3 DGCMV, 2 BZVGH, 7 RZBF => 8 MNPBV
  14 WXWHD => 2 XMBS
  1 BZVGH => 8 FLXL
  8 VXFJM, 1 NFTJ => 2 WXWHD
  2 LXJPK => 9 ZSQR
  5 NRBGS, 1 LBFXF => 9 FXGH
  4 NRBGS, 27 CHNX => 9 PCHWB
  3 LBFXF => 4 TJZVQ
  185 ORE => 2 VQTFW
  1 RTVFM, 1 TBPWN => 6 DGCMV
  10 NRBGS => 3 ZQDN
  5 JSBVZ, 8 FXGH, 1 TJZVQ => 7 NPNGZ
  1 PCHWB, 6 LXJPK, 5 LTGJ => 2 ZXWB
  1 NPNGZ, 24 FMKT => 6 WJTRC
  4 KDCG, 33 BZNB => 3 KGNH
  2 KGNH, 4 ZTCM, 15 CHNX => 6 BDCLW
  10 LXJPK, 18 TJZVQ, 1 FXGH => 7 BZVGH
  27 DBVD, 2 CRNMW, 8 ZTCM, 8 RNSXD, 14 VSBV, 6 ZMWC, 37 TBPWN, 53 SRFQ => 1 FUEL
  19 FXGH, 4 TJZVQ => 3 BZNB
  17 QVDFQ, 26 KDCG, 7 CHNX => 3 RTVFM
  111 ORE => 6 KVWJG
  3 ZTCM => 6 DKFT
  124 ORE => 6 NRBGS
IN

TEST_A = <<~TEST
  10 ORE => 10 A
  1 ORE => 1 B
  7 A, 1 B => 1 C
  7 A, 1 C => 1 D
  7 A, 1 D => 1 E
  7 A, 1 E => 1 FUEL
TEST

class Node
  attr_reader :name, :batch, :formula

  def initialize(name, batch)
    @name  = name
    @batch = batch
    @formula = nil
  end

  def add_formula(formula)
    @formula = formula
  end

  def ore_required(need = {}, have = {})
    formula.map do |node, required|
      if node.name == 'ORE'
        carry
      else
        batches = (required / node.batch.to_f).ceil

        binding.b
        node.ore_required * batches
      end
    end
  end
end

class Graph
  attr_reader :nodes

  def initialize
    @nodes = []
  end

  def add_node(name, batch)
    nodes.push Node.new(name, batch.to_i)
  end

  def find_node(name)
    nodes.find { _1.name == name }
  end

  def start = find_node('FUEL')
end

class Builder
  attr_reader :graph, :built, :extra, :queue

  def initialize(graph)
    @graph = graph
    @built = Hash.new(0)
    @extra = Hash.new(0)
    @queue = [graph.start.formula]
  end

  def call
    until queue.empty?
      formula, count = queue.pop

      formula.each do |node, required|
        if @extra[node.name] >= required
          @built[node.name] += required
          @extra[node.name] -= required
        end
        # if there are enough materials in the extra, then subtract them and add it to built,
        #
        # else add the formula to the queue
      end
    end
  end
end

set = TEST_A

graph = Graph.new

set.scan(/=> (\d+) ([A-Z]*)/).map(&:reverse).map { graph.add_node(*_1) }

graph.add_node('ORE', 1)

set.split("\n").map { _1.scan(/(\d+) (\w*)/) }.each do |edge|
  base = edge.pop.last
  edge = edge.map { [graph.find_node(_1.last), _1.first.to_i] }.to_h
  graph.find_node(base).add_formula(edge)
end

builder = Builder.new(graph)
builder.call

debugger
