datas = File.read('07.txt').split /\n/
#  partie 1
def contain_type_bag_directly(array, color)
  regex = /\d #{color}/
  array.select { |s| s.match regex}.map { |s| s.split(' ')[0..1].join(' ') }
end

total = []
contain_shiny_bags = ['shiny gold']
until contain_shiny_bags == []
  array = contain_shiny_bags.clone
  contain_shiny_bags = []
  array.each do |s|
    contain_shiny_bags << contain_type_bag_directly(datas, s)
  end
  contain_shiny_bags = contain_shiny_bags.flatten
  total << contain_shiny_bags

end
total_final = total.flatten.uniq
# p total_final.count

# partie 2
def find_the_container(array, theone)
  regex = /^#{theone}/
  string = array.select { |s| s.match regex }[0]
end

def contained_bag(container)
  if container["no other bags"].nil?
    regex = /\d \w+ \w+/
    container = container.split(',').select { |s| s.match regex}.map { |s| s[regex] }.map { |s| s[regex] }
    hashes = []
    container.each do |s|
      hash = Hash.new
      hash[:name] = s.strip[2, s.length - 1]
      hash[:quantity] = s.strip[0].to_i
      hashes << hash
    end
    return hashes
  else
    hash = Hash.new
    hash[:name] = container.split(' ')[0..1].join(' ')
    hash[:quantity] = 1
    return hash
  end
end

count = 0
containers = [{name: 'shiny gold', quantity: 1}]
total = containers.clone
until containers == []
  array = containers.clone
  containers = []
  array.each do |h|
    # p h
    # p h[:name]
    container = find_the_container(datas, h[:name])
    if container["no other bags"].nil?
    containers << contained_bag(container)
    else
    end
    containers = containers.flatten
  end
  total << containers
end

p containers
p total


#  je suis dans le sac a
#  j'ai une somme de sac + le nombre de sac dans les autrres


