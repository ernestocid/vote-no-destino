require 'rails_helper'

describe Option, type: :model do
  before(:each) do
    create_sample_options
  end

  let(:new_option) { build(:option) }

  describe '#name' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe '.build_random_combinations' do
    it 'returns an array with random option combinations' do
      combinations = Option.build_random_combinations

      expect(combinations.class).to be_equal Array
      expect(combinations.size).to be_equal 10
    end
  end
end
