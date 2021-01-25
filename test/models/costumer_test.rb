require 'test_helper'
require 'rails_helper'

class CustomerTest < ActiveSupport::TestCase
  RSpec.describe Customer, type: :model do
    describe 'associations' do
      it { is_expected.to belong_to(:order) }
    end
  
    describe 'validations' do
      it { is_expected.to validate_presence_of(:external_id) }
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_presence_of(:contact) }
    end
  end
end
