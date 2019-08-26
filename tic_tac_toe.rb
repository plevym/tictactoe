class TicTacToe
  def initialize(options = {})
    @gamestate = options.fetch(:gamestate)
    @human     = options.fetch(:human)
    @computer  = options.fetch(:computer)
    @display   = options.fetch(:display)
  rescue StandardError
    raise 'You need to pass a gamestate, a human, an ai, and a display to initialize a TicTacToe Game'
  end

  def play_game
    @display.setup_human(@human)

    until @gamestate.game_over?
      @display.board
      make_next_move(next_move)
    end

    @display.results
  end

  private

  def next_move
    @gamestate.players_turn? ? @display.ask_for_move : @computer.decide_move
  end

  def make_next_move(move)
    @gamestate.move(move)
  end
end
