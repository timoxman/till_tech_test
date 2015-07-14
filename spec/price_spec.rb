require 'rails_helper'

describe Price, type: :model do
  it { is_expected.to belong_to :pricelist }
end