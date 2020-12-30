require 'set'

instructions = []
File.readlines('data.txt').each do |line|
  code, argument = line.split(' ')
  instructions.push [code, argument.to_i]
end

acc = 0
i = 0
already_visited = Set.new

until already_visited.include? i
  code, argument = instructions[i]
  already_visited.add i

  case code
  when 'nop'
    i += 1
  when 'acc'
    acc += argument
    i += 1
  when 'jmp'
    i += argument
  end
end

puts acc
