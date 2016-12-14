def initialize_keypad
  @keypad = Hash.new
  @keypad[1] = [0,0]
  @keypad[2] = [0,1]
  @keypad[3] = [0,2]

  @keypad[4] = [1,0]
  @keypad[5] = [1,1]
  @keypad[6] = [1,2]

  @keypad[7] = [2,0]
  @keypad[8] = [2,1]
  @keypad[9] = [2,2]


end

initialize_keypad
@keypad.each do |i, v|
  puts "#{i}: #{v.join(', ')}"
end

