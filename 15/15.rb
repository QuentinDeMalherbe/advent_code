numbers = File.read('input.txt').chomp.split(',').map(&:to_i)
turns = numbers.dup
memory = Hash.new { [] }

numbers.each_with_index do |number, turn|
  memory[number] = [turn]
  puts "Turn #{turn + 1}: #{number}"
end

goal = 30000000

while turns.length < goal
  turn = turns.length
  previous = turns.last

  before_last, last = memory[previous][-2..]

  speak = last.nil? ? 0 : last - before_last

  # You could store only the last two numbers, but with this set of data there
  # is really no point
  memory[speak] = memory[speak].push(turn)

  puts "Turn #{turn + 1}, speaking #{speak} (#{(turn / goal.to_f * 100).round}%)" if (turn + 1) % (goal / 100) == 0

  turns.push speak
end

puts turns.last
