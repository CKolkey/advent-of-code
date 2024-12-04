require "debug"

input = <<~TEST
  Monkey 0:
    Starting items: 79, 98
    Operation: new = old * 19
    Test: divisible by 23
      If true: throw to monkey 2
      If false: throw to monkey 3

  Monkey 1:
    Starting items: 54, 65, 75, 74
    Operation: new = old + 6
    Test: divisible by 19
      If true: throw to monkey 2
      If false: throw to monkey 0

  Monkey 2:
    Starting items: 79, 60, 97
    Operation: new = old * old
    Test: divisible by 13
      If true: throw to monkey 1
      If false: throw to monkey 3

  Monkey 3:
    Starting items: 74
    Operation: new = old + 3
    Test: divisible by 17
      If true: throw to monkey 0
      If false: throw to monkey 1
TEST

input = <<~REAL
  Monkey 0:
    Starting items: 83, 62, 93
    Operation: new = old * 17
    Test: divisible by 2
      If true: throw to monkey 1
      If false: throw to monkey 6

  Monkey 1:
    Starting items: 90, 55
    Operation: new = old + 1
    Test: divisible by 17
      If true: throw to monkey 6
      If false: throw to monkey 3

  Monkey 2:
    Starting items: 91, 78, 80, 97, 79, 88
    Operation: new = old + 3
    Test: divisible by 19
      If true: throw to monkey 7
      If false: throw to monkey 5

  Monkey 3:
    Starting items: 64, 80, 83, 89, 59
    Operation: new = old + 5
    Test: divisible by 3
      If true: throw to monkey 7
      If false: throw to monkey 2

  Monkey 4:
    Starting items: 98, 92, 99, 51
    Operation: new = old * old
    Test: divisible by 5
      If true: throw to monkey 0
      If false: throw to monkey 1

  Monkey 5:
    Starting items: 68, 57, 95, 85, 98, 75, 98, 75
    Operation: new = old + 2
    Test: divisible by 13
      If true: throw to monkey 4
      If false: throw to monkey 0

  Monkey 6:
    Starting items: 74
    Operation: new = old + 4
    Test: divisible by 7
      If true: throw to monkey 3
      If false: throw to monkey 2

  Monkey 7:
    Starting items: 68, 64, 60, 68, 87, 80, 82
    Operation: new = old * 19
    Test: divisible by 11
      If true: throw to monkey 4
      If false: throw to monkey 5
REAL

class Monkey
  attr_reader :id, :items, :inspections

  def initialize(id, items, operation, test, success, failure)
    @id          = id
    @items       = items
    @operation   = operation
    @test        = test
    @success     = success
    @failure     = failure
    @inspections = 0
  end

  def take_turn!
    until @items.empty?
      @inspections += 1
      item = operation(@items.shift) / 3

      if test_item?(item)
        throw(item, @success)
      else
        throw(item, @failure)
      end
    end
  end

  def receive_item(item)
    @items << item
  end

  def operation(old) # rubocop:disable Lint/UnusedMethodArgument
    eval(@operation)
  end

  private

  def test_item?(n)
    (n % @test).zero?
  end

  def throw(item, recipient)
    $troop.find { _1.id == recipient }.receive_item(item)
  end
end

def parse_int(str) = str.scan(/\d+/).first.to_i

$troop = input.split("\n\n").map do |monkey|
  id, items, operation, test, success, failure = monkey.split("\n")

  Monkey.new(
    parse_int(id),
    items.scan(/\d+/).map(&:to_i),
    operation.scan(/: new = (.*)$/).flatten.first,
    parse_int(test),
    parse_int(success),
    parse_int(failure)
  )
end

20.times { $troop.map(&:take_turn!) }
puts $troop.map(&:inspections).max(2).reduce(:*)
