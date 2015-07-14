require 'rails_helper'

describe Pricelist, type: :model do
  it { is_expected.to have_many :prices }
end