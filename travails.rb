class Moves
  attr_accessor :loc
  attr_accessor :parent

  def initialize(loc, parent)
    @loc = loc
    @parent = parent
  end
end
def knight_moves(orig, dest)
  done = false
  origin = Moves.new(orig, nil)
  list = [origin]
  if dest == origin.loc
    done = true
    final_move = origin
  end
  while not done
    for moves in [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
      x = list[0].loc[0] + moves[0]
      y = list[0].loc[1] + moves[1]
      if x < 0 or x >= 8 or y < 0 or y >= 8
        next
      end
      child = Moves.new([x, y], list[0])
      if child.loc == dest
        done = true
        final_move = child
        break
      end
      list.push(child)
    end
    list.shift
  end
  move_list = []
  while final_move != nil
    move_list.unshift(final_move.loc)
    final_move = final_move.parent
  end
  return move_list
end
length = 0
longest = []
for a in 0..7
  for b in 0..7
    for x in 0..7
      for y in 0..7
        moves = knight_moves([a,b], [x,y])
        if moves.length > length
          length = moves.length
          longest = [moves]
        elsif moves.length == length
          longest.push(moves)
        end
      end
    end
  end
end
# for moves in longest
#   for spot in moves
#     puts spot.join(", ")
#   end
#   puts
# end

for spot in knight_moves([0,0], [1,1])
  puts spot.join(", ")
end
