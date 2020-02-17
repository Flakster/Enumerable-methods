#!/usr/bin/env ruby
module Enumerable

  # definition of the my_each method

  def my_each
    return to_enum(:my_each) unless block_given? #no block given?, then return an enumerator
    for element in self do # rubocop:disable Style/For 
      yield(element)
    end
    self
  end

  # definition of the my_each_with_index method

  def my_each_with_index
    return to_enum(:my_each) unless block_given? #no block given?, then return an enumerator
    index=0
    for element in self do # rubocop:disable Style/For
      yield(element,index)
      index+=1
    end
    self
  end

  # definition of the my_select method

  def my_select
    return to_enum(:my_each) unless block_given? #no block given?, then return an enumerator
    new_array=[]
    self.my_each do |element|
      new_array << element if yield(element)
    end
    new_array
  end

  # definition of the my_all? method

  def my_all?
    return true unless block_given? # no block given?, then return true
    for element in self do # rubocop:disable Style/For
      return false unless yield(element)
    end
    true
  end

  # definition of the my_none? method

  def my_none?
    return false unless block_given? # no block given?, then return false
    for element in self do # rubocop:disable Style/For
      return false if yield(element)
    end
    true
  end

  # definition of the my_any? method

  def my_any?
    if block_given?
      for element in self do # rubocop:disable Style/For
        return true if yield(element)
      end
      false
    else
      for element in self do # rubocop:disable Style/For
        return true if element
      end
      false
    end
  end

  # definition of the my_count method

  def my_count(*args) # method accepts cero or 1 arguments
    raise ArgumentError.new("wrong number of arguments (given #{args.length}, expected 1)") if args.length > 1
    num=0
    if args.length >0 && block_given?
      warn "#{__FILE__}:#{__LINE__}: Warning: given block not used"
    end
    for element in self do # rubocop:disable Style/For
      if args.length > 0
        num+=1 if element == args[0]
      else
        num+=1 if yield(element)
      end
    end
    num
  end 

end
