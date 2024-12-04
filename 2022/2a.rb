SHAPES = {
  'A' => :rock, 'B' => :paper, 'C' => :scissors,
  'X' => :rock, 'Y' => :paper, 'Z' => :scissors
}

SHAPE_SCORE = { rock: 1, paper: 2, scissors: 3 }

class Game
  def initialize(opponent, player)
    @opponent = opponent
    @player   = player
  end

  def player_score
    score = if player_won?
              6
            elsif draw?
              3
            else
              0
            end

    score + SHAPE_SCORE[@player]
  end

  def draw?
    @opponent == @player
  end

  def player_won?
    case @opponent
    when :rock
      @player == :paper
    when :paper
      @player == :scissors
    when :scissors
      @player == :rock
    end
  end
end

puts File.read('2.input')
         .split("\n")
         .map { Game.new(*_1.split.map { |shape| SHAPES[shape] }) }
         .sum(&:player_score)
