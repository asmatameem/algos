# results []
#
# []
# [a1]
#
# [a2]
# [a1, a2]
#
# [a3]
# [a1, a3]
# [a2, a3]
# [a1, a2, a3]
#
# [a4]
# [a1, a4]
# [a2,a4]
# [a1, a2, a4]
# [a3, a4]
# [a1, a3, a4]
# [a2, a3, a4]
# [a1, a2, a3, a4]
require 'pry'
def subset(input)
  results = []
  results << []
  input.each do |a|
    subset = []
    results.each do |sub|
      subset << sub.flatten + [a]
    end
    subset.each do |sub|
      results << sub
    end
  end
  results
end

input = %w(a1 a2 a3 a4)

results = subset(input)
results.each do |e|
  puts "Subset: #{e}"
end
