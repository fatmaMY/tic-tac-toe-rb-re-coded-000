  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
  def input_to_index(user_input)
     user_input.to_i-1
  end
  def move(board, position,character)
board[position.to_i-1]=character
  end
  def position_taken?(board, position)
    !(board[position].nil? || board[position] == " ")
  end
  def valid_move?(board, index)
    if !position_taken?(board, index.to_i-1)&& index.to_i.between?(1, 9)
      return  true
      end
      return false
    end
  def turn(board)
    puts "Please enter 1-9:"
    input=gets.strip
  if  !valid_move?(board, input)
    turn(board)
  else
    move(board, input,character="X")
    display_board(board)
  end
  def turn_count(board)

    counter = 0
    board.each do |index|
      if index =="O" || index =="X"
        counter += 1

      end
    end
    return counter
  end
  def current_player(board)
    if turn_count(board) % 2 == 0
      return "X"
    else "O"
    end
  end
  def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
index1 = win_combo[0]
index2 = win_combo[1]
index3 = win_combo[2]
position_1 = board[index1]
position_2 = board[index2]
position_3 = board[index3]
if position_1 == "X" && position_2 == "X" && position_3 == "X"
  return win_combo
elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
  return win_combo
else
  false
end
end
false
end
def full?(board)
  board.each do |location|
    if location == " "
      return false

    end
    true
  end

end
def draw?(board)
  if won?(board)
  return false
elsif full?(board)
  return true

end
end
def over?(board)
  won?(board) || draw?(board)
end
def winner(board)
if won?(board)==[0,4,8]
  return "X"
elsif won?(board)==[1,4,7]
  return "O"
elsif draw?(board)
  return nil
end
end
def play(board)
  while !over?(board)
    turn(board)
  end
    win_combo=won?(board)
    if  draw?(board)
        puts "Cats Game!"
  elsif won?(board)
    puts "Congratulations #{board[win_combo.first]}!"

end
end
end
