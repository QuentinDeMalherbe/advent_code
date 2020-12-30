datas = File.read('data.txt').split /\n/
# patie 1
seats = []
seat_ids = []
datas.each do |data|
  min = 0
  max = 127
  data[0..5].split('').each do |letter|
    letter == 'F' ? min = min : min = (max + min) / 2  + 1
    letter == 'F' ? max = (max + min) / 2  : max = max
  end
  p min
  data[6] == 'F' ? row = min : row = max
  min = 0
  max = 7
  data[7..8].split('').each do |letter|
    letter == 'L' ? min = min : min = (max + min) / 2  + 1
    letter == 'L' ? max = (max + min) / 2  : max = max
  end
  data[9]  == 'L' ? column = min : column = max
  seats << { row: row,  column: column , id: row*8 +column}
  seat_ids << row * 8 + column
end

p seat_ids.sort!

seat_ids.sort!.each_with_index do |id,index|

  if index < seat_ids.count - 2 && id == seat_ids[index + 1] - 2
    p id + 1
  end
end

