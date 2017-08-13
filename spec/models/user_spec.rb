require 'rails_helper'

describe User, type: :model do
  describe '#name' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe '#email' do
    it { is_expected.to validate_presence_of(:email) }
    it { should allow_value('jon@winterfell.com').for(:email) }
    it { should_not allow_value('jonwinterfell.com').for(:email) }
    it { should_not allow_value('jon').for(:email) }
  end
end
