# frozen_string_literal: true

# White Piece superclass
class WhitePiece
  attr_accessor :location, :legal_moves
  attr_reader :color, :symbol

  def initialize(location)
    @location = location
    @color = 'white'
  end

  class << self
    attr_reader :starting_locations
  end
end

# Black Piece superclass
class BlackPiece
  attr_accessor :location, :legal_moves
  attr_reader :color, :symbol

  def initialize(location)
    @location = location
    @color = 'black'
  end

  class << self
    attr_reader :starting_locations
  end
end

# White Pawn class
class WhitePawn < WhitePiece
  @starting_locations = %w[a2 b2 c2 d2 e2 f2 g2 h2]

  def initialize(location)
    super
    @symbol = "\u2659".encode('utf-8')
  end

  def legal_moves(board)
    rank = location.split(//)[0].ord
    file = location.split(//)[1].to_i
    starting_locations = WhitePawn.starting_locations
    moveset = []
    moveset << [rank.chr, file + 1].join
    moveset << [rank.chr, file + 2].join if starting_locations.include?(location)
    capture_left = [(rank - 1).chr, file + 1].join
    capture_left_square = board.squares.select { |square| square.location == capture_left }.pop
    moveset << capture_left if !capture_left_square.piece.nil? && capture_left_square.piece.color == 'black'
    capture_right = [(rank + 1).chr, file + 1].join
    capture_right_square = board.squares.select { |square| square.location == capture_right }.pop
    moveset << capture_right if !capture_right_square.piece.nil? && capture_right_square.piece.color == 'black'
    moveset
  end
end

# Black Pawn class
class BlackPawn < BlackPiece
  @starting_locations = %w[a7 b7 c7 d7 e7 f7 g7 h7]

  def initialize(location)
    super
    @symbol = "\u265F".encode('utf-8')
  end

  def legal_moves(board)
    rank = location.split(//)[0].ord
    file = location.split(//)[1].to_i
    moveset = []
    moveset << [rank.chr, file + 1].join
    moveset << [rank.chr, file + 2].join if BlackPawn.starting_locations.include?(location)
    capture_left = [(rank - 1).chr, file + 1].join
    capture_left_square = board.squares.select { |square| square.location == capture_left }.pop
    moveset << capture_left if !capture_left_square.piece.nil? && capture_left_square.piece.color == 'black'
    capture_right = [(rank + 1).chr, file + 1].join
    capture_right_square = board.squares.select { |square| square.location == capture_right }.pop
    moveset << capture_right if !capture_right_square.piece.nil? && capture_right_square.piece.color == 'black'
    moveset
  end
end

# White Rook class
class WhiteRook < WhitePiece
  @starting_locations = %w[a1 h1]

  def initialize(location)
    super
    @symbol = "\u2656".encode('utf-8')
  end
end

# Black Rook class
class BlackRook < BlackPiece
  @starting_locations = %w[a8 h8]

  def initialize(location)
    super
    @symbol = "\u265C".encode('utf-8')
  end
end

# White Knight class
class WhiteKnight < WhitePiece
  @starting_locations = %w[b1 g1]

  def initialize(location)
    super
    @symbol = "\u2658".encode('utf-8')
  end
end

# Black Knight class
class BlackKnight < BlackPiece
  @starting_locations = %w[b8 g8]

  def initialize(location)
    super
    @symbol = "\u265E".encode('utf-8')
  end
end

# White Bishop class
class WhiteBishop < WhitePiece
  @starting_locations = %w[c1 f1]

  def initialize(location)
    super
    @symbol = "\u2657".encode('utf-8')
  end
end

# Black Bishop class
class BlackBishop < BlackPiece
  @starting_locations = %w[c8 f8]

  def initialize(location)
    super
    @symbol = "\u265D".encode('utf-8')
  end
end

# White Queen class
class WhiteQueen < WhitePiece
  @starting_locations = %w[d1]

  def initialize(location)
    super
    @symbol = "\u2655".encode('utf-8')
  end
end

# Black Queen class
class BlackQueen < BlackPiece
  @starting_locations = %w[d8]

  def initialize(location)
    super
    @symbol = "\u265B".encode('utf-8')
  end
end

# White King class
class WhiteKing < WhitePiece
  @starting_locations = %w[e1]

  def initialize(location)
    super
    @symbol = "\u2654".encode('utf-8')
  end
end

# Black King class
class BlackKing < BlackPiece
  @starting_locations = %w[e8]

  def initialize(location)
    super
    @symbol = "\u265A".encode('utf-8')
  end
end
