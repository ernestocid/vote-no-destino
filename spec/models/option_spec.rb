require 'rails_helper'

describe Option, type: :model do
  let(:new_option) { build(:option) }

  describe '#name' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
