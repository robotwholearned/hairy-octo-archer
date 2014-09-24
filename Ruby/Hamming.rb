#File:  hamming.rb


def compute(a, b)
  if (a.is_a?(String) && b.is_a?(String))
    (a^b).to_s(2).count("1")
  end
end

def Hamming.h1(a, b)
  ret = 0
  xor = a ^ b
  until xor == 0
    ret +=1
    xor&= xor -1
  end
  ret
end

def Hamming.h2(a, b)
  (a^b).to_s(2).count("1")
end


if __FILE__ == $0
#  Hamming.h1('A', 'B')

def hamm_dist(a, b)
  dist = 0
  val = a ^ b

  while not val.zero?
    dist += 1
    val &= val - 1
  end
  dist
end

p hamm_dist(2323409845, 1782647144) # => 17

end
