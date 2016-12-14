instructions =
# ['R8', 'R4', 'R4', 'R8']

# ['R2', 'R2', 'R2']

# ['R2', 'L3']

['R4', 'R1', 'L2', 'R1', 'L1', 'L1', 'R1', 'L5', 'R1', 'R5', 'L2', 'R3', 'L3', 'L4', 'R4', 'R4', 'R3', 'L5', 'L1', 'R5', 'R3', 'L4', 'R1', 'R5', 'L1', 'R3', 'L2', 'R3', 'R1', 'L4', 'L1', 'R1', 'L1', 'L5', 'R1', 'L2', 'R2', 'L3', 'L5', 'R1', 'R5', 'L1', 'R188', 'L3', 'R2', 'R52', 'R5', 'L3', 'R79', 'L1', 'R5', 'R186', 'R2', 'R1', 'L3', 'L5', 'L2', 'R2', 'R4', 'R5', 'R5', 'L5', 'L4', 'R5', 'R3', 'L4', 'R4', 'L4', 'L4', 'R5', 'L4', 'L3', 'L1', 'L4', 'R1', 'R2', 'L5', 'R3', 'L4', 'R3', 'L3', 'L5', 'R1', 'R1', 'L3', 'R2', 'R1', 'R2', 'R2', 'L4', 'R5', 'R1', 'R3', 'R2', 'L2', 'L2', 'L1', 'R2', 'L1', 'L3', 'R5', 'R1', 'R4', 'R5', 'R2', 'R2', 'R4', 'R4', 'R1', 'L3', 'R4', 'L2', 'R2', 'R1', 'R3', 'L5', 'R5', 'R2', 'R5', 'L1', 'R2', 'R4', 'L1', 'R5', 'L3', 'L3', 'R1', 'L4', 'R2', 'L2', 'R1', 'L1', 'R4', 'R3', 'L2', 'L3', 'R3', 'L2', 'R1', 'L4', 'R5', 'L1', 'R5', 'L2', 'L1', 'L5', 'L2', 'L5', 'L2', 'L4', 'L2', 'R3']

def get_direction(direction, this_direction)
  case this_direction
    when 'R'
      direction = direction + 270
    when 'L'
      direction = direction + 90
  end

  if direction >= 360
    direction = direction - 360
  end

  direction
end

def get_coordinates(direction, coordinates, this_blocks, stored_coordinates)
  case direction
  when 0
    this_blocks.times do
      coordinates[0] = coordinates[0] + 1
      puts coordinates.join(", ") if stored_coordinates.detect {|x| x[0] == coordinates[0] && x[1] == coordinates[1]}
      stored_coordinates << [coordinates[0], coordinates[1]]
    end
  when 90
    this_blocks.times do
      coordinates[1] = coordinates[1] + 1
      puts coordinates.join(", ") if stored_coordinates.detect {|x| x[0] == coordinates[0] && x[1] == coordinates[1]}
      stored_coordinates << [coordinates[0], coordinates[1]]
    end
  when 180
    this_blocks.times do
      coordinates[0] = coordinates[0] - 1
      puts coordinates.join(", ") if stored_coordinates.detect {|x| x[0] == coordinates[0] && x[1] == coordinates[1]}
      stored_coordinates << [coordinates[0], coordinates[1]]
    end
  when 270
    this_blocks.times do
      coordinates[1] = coordinates[1] - 1
      puts coordinates.join(", ") if stored_coordinates.detect {|x| x[0] == coordinates[0] && x[1] == coordinates[1]}
      stored_coordinates << [coordinates[0], coordinates[1]]
    end
  end
  coordinates
end




direction = 90
coordinates = [0, 0]
stored_coordinates = []

instructions.each do |instruction|
  this_direction = instruction[0]
  this_blocks = instruction[1..-1].to_i

  direction = get_direction(direction, this_direction)
  coordinates = get_coordinates(direction, coordinates, this_blocks, stored_coordinates)
end

#puts coordinates.inject(0){|sum, x| sum + x.abs}.to_s

