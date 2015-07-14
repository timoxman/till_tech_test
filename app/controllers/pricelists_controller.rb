class PricelistsController < ApplicationController

    def index
      if Pricelist.count
        @message = "Pricelist found"
      else
        @message = "No Pricelist yet"
      end
    end

    def new
      json_file = File.read('hipstercoffee.json')
      pricelist = JSON.parse(json_file)
      pricelistAR = Pricelist.create(shopName: pricelist[0]["shopName"], address: pricelist[0]["address"], phone: pricelist[0]["phone"])

      pricelist[0]["prices"][0].keys.each do |item|
        Price.create(item: item, price: pricelist[0]["prices"][0][item], pricelist_id: pricelistAR.id)
      end


      redirect_to '/pricelists'
 #    render :action => 'create'
    end

  def create
    #pick up json
    byebug
    redirect_to '/pricelists'
  end




end
