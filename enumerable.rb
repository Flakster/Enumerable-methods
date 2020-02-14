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
end

dogs= ["Gordis", "Chiquis", "Goro", "Duquesa", "Fenriz", "Ital", "Lemmy", "Pinpin"]


