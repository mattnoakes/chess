# frozen_string_literal: true

# game pieces
class Pawn
  attr_accessor :location
  attr_reader :color

  @white_starting_locations = %w[a2 b2 c2 d2 e2 f2 g2 h2]
  @black_starting_locations = %w[a7 b7 c7 d7 e7 f7 g7 h7]

  def initialize(color, location)
    @symbol = 'p'
    @color = color
    @location = location
    @legal_moves = []
  end

  # def get_legal_moves

  # end
end