require 'rails_helper'

feature 'pricelists' do


  context 'no pricelists have been added' do
    scenario 'should display a prompt to show no pricelists' do
      visit '/pricelists'
      expect(page).to have_content 'No Pricelist yet'
    #  expect(page).to have_link 'Add a pricelist'
    end
  end

  context 'a pricelist has been added' do
    scenario 'database should hold records when a pricelist has been added' do
      visit '/pricelists/new'
      expect(Pricelist.count).to eq 1
      expect(Price.count).to eq 15
      expect(page).to have_content 'Pricelist found'
    #  expect(page).to have_link 'Add a pricelist'
    end
  end



end