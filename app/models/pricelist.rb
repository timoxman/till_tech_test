class Pricelist < ActiveRecord::Base

  has_many :prices


  #its about the data, so it should be in the model
  def self.format_phone(phone_no)
    "Phone: +#{phone_no[0]} (#{phone_no[1..3]}) #{phone_no[4..6]}-#{phone_no[7..-1]} "
  end

end
