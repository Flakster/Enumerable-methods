require_relative '../enumerable'
RSpec.describe Enumerable do
  let(:arr1) { %w[ant bear cat] }
  let(:arr2) { [nil, true, 99] }
  let(:arr3) { [1, 2, 3, 4, 5] }
  #let(:arr4) {  }
  #let(:arr5) {  }
  #let(:arr6) {  }
  #let(:arr7) {  }
  #let(:arr8) {  }
  #let(:arr9) {  }
  #let(:arr0) {  }

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

    it 'returns true if no block is given and none of the elements has a falsy value' do
      expect(arr1.my_all?).to be true
    end
  end
end