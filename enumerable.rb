#!/usr/bin/env ruby

# frozen_string_literal: true

# Some methods will be added to this module
module Enumerable
  # definition of the my_each method

  def my_each
    return to_enum(:my_each) unless block_given?

    for element in self do # rubocop:disable Style/For
      yield(element)
    end
    self
  end

  # definition of the my_each_with_index method

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    index = 0
    my_each do |element|
      yield(element, index)
      index += 1
    end
    self
  end

  # definition of the my_select method

  def my_select
    return to_enum(:my_select) unless block_given?

    new_array = []
    my_each do |element|
      new_array << element if yield(element)
    end
    new_array
  end

  # definition of the my_all? method

  def my_all?
    return true unless block_given?

    for element in self do # rubocop:disable Style/For
      return false unless yield(element)
    end
    true
  end

  # definition of the my_none? method

  def my_none?
    return false unless block_given?

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
    else
      for element in self do # rubocop:disable Style/For
        return true if element
      end
    end
    false
  end

  # definition of the my_count method

  def my_count(*args)
    args.length > 1 &&
      (raise ArgumentError, "Too much args.: #{args.length}, max.: 1)")
    total = 0
    if args.empty?
      return length unless block_given?

      my_each { |element| total += 1 if yield(element) }
    else
      my_each { |element| total += 1 if element == args[0] }
    end
    total
  end

  # definition of the my_map method

  def my_map(arg_proc = nil)
    new_array = []
    unless arg_proc.nil?
      my_each do  |element|
        new_array << arg_proc.call(element)
      end
      new_array
    else
      return to_enum(:my_map) unless block_given?
      my_each do  |element|
        new_array << yield(element)
      end
      new_array
    end
  end

  # definition of the my_inject method

  def my_inject(initial = nil, method = nil)
    memo = first
    initial_given = false
    if !initial.nil? && initial.class != Symbol
      memo = initial
      initial_given = true
    end
    initial.class == Symbol && method.nil? && method = initial
    unless method.nil?
      case method
      when :+
        method_proc = proc { |acum, n| acum + n }
      when :-
        method_proc = proc { |acum, n| acum - n }
      when :*
        method_proc = proc { |acum, n| acum * n }
      when :/
        method_proc = proc { |acum, n| acum / n }
      when :**
        method_proc = proc { |acum, n| acum**n }
      end
    end
    my_each_with_index do |element, index|
      unless index.zero? && !initial_given
        memo =  if block_given?
                  yield(memo, element)
                else
                    method_proc.call(memo, element)
                end
      end
    end
    memo
  end
end

# definition of the multiply_els method

def multiply_els(array)
  array.my_inject(:*)
end