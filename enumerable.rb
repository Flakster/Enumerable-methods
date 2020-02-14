module Enumerable

  #definition of the my_each method
  def my_each
    return (to_enum(:my_each)) unless block_given? #no block given?, then return an enumerator
    0.upto(self.length-1) do |i|
      yield(self[i])
    end
  end
  
  #definition of the my_each_with_index method
  def my_each_with_index
    return (to_enum(:my_each)) unless block_given? #no block given?, then return an enumerator
    0.upto(self.length-1) do |i|
      yield(self[i], i)
    end
  end
end



