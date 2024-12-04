SHAPES        = { 'A' => :rock, 'B' => :paper, 'C' => :scissors }
OUTCOMES      = { 'X' => :lose, 'Y' => :draw, 'Z'  => :win }
SHAPE_SCORE   = { rock: 1, paper: 2, scissors: 3 }
OUTCOME_SCORE = { win:  6, draw:  3, lose:     0 }

class Game
  def initialize(opponent, outcome)
    @opponent = SHAPES[opponent]
    @outcome  = OUTCOMES[outcome]
  end

  def player_score
    OUTCOME_SCORE[@outcome] + SHAPE_SCORE[player]
  end

  def player
    return @opponent if draw?

    case @opponent
    when :rock
      win? ? :paper : :scissors
    when :paper
      win? ? :scissors : :rock
    when :scissors
      win? ? :rock : :paper
    end
  end

  def win?  = @outcome == :win
  def draw? = @outcome == :draw
end

puts File.read('2.input')
         .split("\n")
         .map { Game.new(*_1.split) }
         .sum(&:player_score)
