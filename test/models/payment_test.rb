require 'test_helper'
require 'rails_helper'

class PaymentTest < ActiveSupport::TestCase

  RSpec.describe Payment, type: :model do
    describe 'associations' do
      it { is_expected.to belong_to(:order) }
    end
  
    describe 'validations' do
      it { is_expected.to validate_presence_of(:type) }
      it { is_expected.to validate_presence_of(:value) }
    end
  end
end
