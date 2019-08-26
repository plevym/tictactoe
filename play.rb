require_relative 'colorize'
require_relative 'game_state'
require_relative 'display'
require_relative 'human'
require_relative 'ai'
require_relative 'tic_tac_toe'

gamestate = GameState.new
human     = Human.new(gamestate)
computer  = Ai.new(gamestate)
display   = Display.new(gamestate)

game_components = {
  gamestate: gamestate,
  human: human,
  computer: computer,
  display: display
}

tictactoe = TicTacToe.new(game_components)
tictactoe.play_game
