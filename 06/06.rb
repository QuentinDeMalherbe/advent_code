datas = File.read('06.txt').split(/\n\n/).map { |s| s.gsub("\n", ' ') }
#  partie 1
datas.map { |s| s.split(" ").join('').split('').uniq.count}.sum
#  parie 2
p datas
count = 0
('a'..'z').to_a.each do |letter|
  datas.each do |s|
    if s.count(letter) == s.split(' ').count
      count += 1
    end
  end
end
p count
