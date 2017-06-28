require 'rails_helper'

RSpec.describe Wiki, type: :model do
  it { is_expected.to belong_to(:user) }
end
