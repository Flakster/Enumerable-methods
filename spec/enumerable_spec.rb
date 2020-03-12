require_relative '../enumerable'
RSpec.describe Enumerable do
  let(:arr1) { %w[ant bear cat] }
  let(:arr2) { [nil, true, 99] }
  let(:arr3) { [1, 2, 3, 4, 5] }
  let(:arr4) { [nil, false, true] }

  describe "#my_each" do
    it 'passes every element of an array to a block' do
      expect(arr1.my_each{ |e| e }).to eql(%w[ant bear cat])
    end

    it 'returns an enumerator if no block is given' do
      expect(arr1.my_each).to be_an(Enumerator)
    end
  end

  describe '#my_each_with_index' do
    it 'passes every element with its index to a block' do
      expect(arr1.my_each_with_index{ |e,i|}).to eql(%w[ant bear cat])
    end

    it 'returns an enumerator if no block is given' do
      expect(arr1.my_each_with_index).to be_an(Enumerator)
    end
  end

  describe '#my_select' do
    it 'returns an array with all the elements for which the given block is true' do
      expect(arr3.my_select{ |e| e.even? }).to eql([2, 4])
    end

    it 'returns an enumerator if no block is given' do
      expect(arr3.my_select).to be_an(Enumerator)      
    end
  end

  describe '#my_all?' do
    it 'returns true if all the elements make the block returns truthy values' do
      expect(arr1.my_all?{ |e| e.length > 2}).to be true
    end

    it 'returns false if for any of the elements the block returns a falsy value' do
      expect(arr1.my_all?{ |e| e.length >= 4 }).to be false
    end

    it 'returns true if no block is given and none of the elements has a falsy value' do
      expect(arr1.my_all?).to be true
    end
  end

  describe '#my_none' do
    it 'returns true if the block never return true for all elements' do
      expect(arr1.my_none?{ |e| e.length == 5 }).to be true
    end
    
    it 'returns true if a pattern is supplied and none of the elements is an instance or matchs the pattern' do
      expect(arr3.my_none?(Float)).to be true
    end

    it 'returns true if no block is given and none of the elements is true' do
      expect([nil, nil].my_none?).to be true 
    end

    it 'returns false if no block is given and at least one of the elements has a truthy value' do
      expect(arr4.my_none?).to be false
    end
  end

  describe '#my_any?' do
    it 'passes each element to the block and returns true if the block ever returns a truthy value' do
      expect(arr1.my_any?{ |e| e.length >=3}). to be true      
    end

    it 'returns whether pattern === element for any element if a pattern is supplied' do
      expect(arr1.my_any?(/d/)).to be false
    end

    it 'returns false if there is no elements and no block is given' do
      expect([].my_any?).to be false
    end
  end

  describe '#my_count' do
    it 'returns the number of elements of an array' do
      expect(arr1.my_count).to eql(3)
    end

    it 'returns the number of elements that are equal to an argument when given' do
      expect([1, 2, 3, 2, 4, 2].my_count(2)).to eql(3)
    end 

    it 'returns the number of elements that make true a given block' do
      expect(arr3.my_count{ |e| e.even? }).to eql(2)
    end
  end

  describe '#my_map' do
    it 'returns a new array with the results of running the given block once for every element of the enum' do
      expect(arr3.my_map{ |e| e * e}).to eql([1, 4, 9, 16, 25])
    end

    it 'returns an enumerator if no block is given' do
      expect(arr1.my_map).to be_an(Enumerator)
    end
  end

  describe '#my_inject' do
    it 'applies a binary operation to each element of an enum and returns the accumulate result' do
      expect(arr3.my_inject(:*)).to eql(120)
    end

    it 'returns the acmumulate starting with an initial value passed as an argument' do
      expect(arr3.my_inject(3, :*)).to eql(360)
    end

    it 'returns the accumulate when the initial value and the operator are given in a block' do
      expect(arr3.my_inject{ |m, e| m + e }).to eql(15)
    end

    it 'returns the accumulate by applying the operator given in the block and starting with the value passed as an argument' do
      expect(arr3.my_inject(100){ |m, e| m + e }).to eql(115)
    end
  end
end