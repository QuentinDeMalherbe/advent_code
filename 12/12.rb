data = File.read('data.txt').split(/\n/)
DIRECTION = ['E', 'N', 'W', 'S']
DIRECTION_INDEX = [1, 2, 3, 4]
ROTATION = ['L', 'R']
coord = [0, 0]
direction = 'E'

def change_direction(s,direction)
  value = s.scan(/\d/).join('').to_i / 90
  case s[0]
  when 'L'
    somme = DIRECTION.index(direction) + value
    somme -= 4 if somme > 3
    return DIRECTION[somme]
  when 'R'
    diff = DIRECTION.index(direction) - value
    diff += 4 if diff.negative?
    return DIRECTION[diff]
  end
end

def forward(s, coord, direction)
  value = s.scan(/\d/).join('').to_i
  case direction
  when 'E'
    coord[0] += value
  when 'W'
    coord[0] -= value
  when 'N'
    coord[1] += value
  when 'S'
    coord[1] -= value
  end
  coord
end

def move(s, coord)
  value = s.scan(/\d/).join('').to_i
  if s[0] == 'E'
    coord[0] += value
  elsif  s[0] == 'W'
    coord[0] -= value
  elsif  s[0] == 'N'
    coord[1] += value
  elsif  s[0] == 'S'
    coord[1] -= value
  end
  coord
end

data.each do |s|
  if DIRECTION.include?(s.strip[0])
    coord = move(s, coord)
  elsif ROTATION.include?(s.strip[0])
    direction = change_direction(s, direction)
  else
    coord = forward(s, coord, direction)
  end
end
p coord[0].abs + coord[1].abs
