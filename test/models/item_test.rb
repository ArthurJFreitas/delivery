require 'test_helper'
require 'rails_helper'

class ItemTest < ActiveSupport::TestCase
  RSpec.describe Item, type: :model do
    describe 'associations' do
      it { is_expected.to belong_to(:order) }
    end
  
    describe 'validations' do
      it { is_expected.to validate_presence_of(:external_code) }
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:price) }
      it { is_expected.to validate_presence_of(:quantity) }
      it { is_expected.to validate_presence_of(:total) }
    end
  end
end
