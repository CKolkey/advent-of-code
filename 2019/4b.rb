require 'debug'

def split_password(password) = password.to_s.chars.map(&:to_i)
def sorted?(password)        = password.sort == password
def cons_double?(password)   = password.each_cons(2).any? { _1.uniq.size == 1 }
def single_double?(password) = password.tally.values.any? { _1 == 2 }

def valid?(password)
  password = split_password(password)

  sorted?(password) && cons_double?(password) && single_double?(password)
end

valid = (168_630..718_098).to_a.select!(&method(:valid?))

puts valid.size == 1145
