require "genpasswd/version"

module Genpasswd
  module_function

  # generate 6 character set
  def generate_set(length = 6)
    ('a'..'z').to_a.shuffle[0, length].join
  end

  # insert capital letter
  def insert_capital(string, count = 1)
    arr = []
    str = string.downcase
    while arr.length < count
      r = rand(str.size - 1)
      if !!str[r].match(/^(\d)+$/)
      else
        arr << r
        arr.uniq!
      end
    end
    arr.each do |i|
      str[i] = str[i].upcase
    end
    return str
  end

  # use BEFORE :insert_capital
  def insert_number(string, count = 1)
    arr = []
    str = string.downcase
    while arr.length < count
      arr << rand(str.size -1)
      arr.uniq!
    end
    arr.each do |i|
      str[i] = rand(9).to_s
    end
    return str
  end

  def prepare(str)
    arr = str.chars.each_slice(6).map(&:join)
    arr.join('-')
  end

  def make
    password = ''
    3.times do
      password += generate_set(6)
    end
    password = insert_number(password)
    password = insert_capital(password)
    puts prepare(password)
  end
end
