module Enumerable

  #definition of the my_each method
  def my_each
    return (to_enum(:my_each)) unless block_given? #no block given?, then return an enumerator
    for element in self do
      yield(element)
    end
    self
  end

  #definition of the my_each_with_index method
  def my_each_with_index
    return (to_enum(:my_each)) unless block_given? #no block given?, then return an enumerator
    index=0
    for element in self do
      yield(element,index)
      index+=1
    end
    self
  end

  #definition of the my_select method
  def my_select
    return (to_enum(:my_each)) unless block_given? #no block given?, then return an enumerator
    new_array=[]
    self.my_each do |element|
      new_array << element if yield(element)
    end
    new_array
  end

  #definition of the my_all? method
  def my_all?
    return true unless block_given? #no block given?, then return true
    for element in self do
      return false unless yield(element)
    end
    true
  end

  #definition of the my_none? method
  def my_none?
    return false unless block_given? #no block given?, then return false
    for element in self do
      return false if yield(element)
    end
    true
  end

end
