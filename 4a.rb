require 'debug'
require 'benchmark'

Benchmark.bm do |run|
  run.report do
    input = (168_630..718_098).to_a.select! do |password|
      password = password.to_s.chars.map(&:to_i)

      password.sort == password &&
        password.each_cons(2).any? { _1.uniq.size == 1 }
    end

    puts 'FAILED' unless input.size == 1686
  end
end
