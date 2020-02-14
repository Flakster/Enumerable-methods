module Enumerable

  #definition of the my_each method
  def my_each
    return (to_enum(:my_each)) unless block_given? #no block passed, then return an enumerator
    0.upto(self.length-1) do |i|
      yield(self[i])
    end
  end


end


