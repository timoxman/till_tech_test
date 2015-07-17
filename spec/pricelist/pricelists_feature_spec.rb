require 'rails_helper'

feature 'pricelists' do


  context 'no pricelists have been added' do
    scenario 'should display a prompt to show no pricelists(PL01)' do
      visit '/pricelists'
      expect(page).to have_content 'No Pricelist yet'
    #  expect(page).to have_link 'Add a pricelist'
    end
  end

  context 'a pricelist has been added' do
    scenario 'database should hold records when a pricelist has been added(PL02)' do
      visit '/pricelists/buildPriceList'
      expect(Pricelist.count).to eq 1
      expect(Price.count).to eq 15
      expect(page).to have_content 'Pricelist found'
    #  expect(page).to have_link 'Add a pricelist'
    end
  end

  context 'a pricelist is returned' do
    scenario 'database loads pricelist and then the menu is returned (PL03)' do
      visit '/pricelists/buildPriceList'
      visit '/pricelists/getMenu'
      expect(page).to have_content 'Cafe Latte'
      expect(page).to have_content '4.75'
      expect(page).to have_content 'Chocolate Chip Muffin'
      expect(page).to have_content '8.2'
    end
  end

  context 'a receipt can be generated' do
    scenario 'a json file is produced as the output to a receipt (PL04)' do
      visit '/pricelists/buildPriceList'
      visit '/pricelists/generateReceipt'
      expect(page).to have_content 'The Coffee Connection'
      expect(page).to have_content '123 Lakeside Way'
      expect(page).to have_content 'Phone: +1 (650) 360-0708'
      expect(page).to have_content 'Table: 1 / [4]'
      expect(page).to have_content 'Jane'
      expect(page).to have_content ' Cafe Latte 2 x £4.75'
      expect(page).to have_content ' Blueberry Muffin 1 x £4.05'
      expect(page).to have_content 'Tax £1.17'
      expect(page).to have_content 'Total £13.55'
    end
  end

  context 'an order total can be calculated' do
    scenario 'database loads pricelist and then order is returned(PL05)' do
      visit '/pricelists/buildPriceList'
      visit '/pricelists/amount'
      expect(page).to have_content '13.55'
    end
  end
end