array = File.read('09.txt').split(/\n/).map { |elt| elt.to_i}
# partie 1
resultat = array.find.with_index { |elt, index|
  if index >= 25
    permutation = array.select.with_index { |int, i| i >= index - 25 && i < index}
    !permutation.permutation(2).to_a.map {|a| a.sum}.include?(elt)
  end
}
p resultat
# partie 2
array_before = array.select.with_index { |int, i| i < array.index(resultat) }
p array_before
p array_before.count

found = false

i = 0
j = i+1
until found
  if array[i..j].sum == resultat
    somme =  array[i..j]
    found = true
  elsif array[i..j].sum > resultat
    i += 1
    j = i + 1
  else
    p j
    j += 1
  end
end

p somme.min + somme.max
