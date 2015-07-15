require 'pricelists_helper'

class PricelistsController < ApplicationController

  include PricelistsHelper

  def index
    if Pricelist.count > 0
      @message = "Pricelist found"
    else
      @message = "No Pricelist yet"
    end
  end

  def new
    #not required at the moment
  end

  def create
    #not required at the moment
  end

  def buildPriceList
    json_file = File.read('hipstercoffee.json')
    pricelist = JSON.parse(json_file)
    pricelistAR = Pricelist.create(shopName: pricelist[0]["shopName"], address: pricelist[0]["address"], phone: pricelist[0]["phone"])

    pricelist[0]["prices"][0].keys.each do |item|
      Price.create(item: item, price: pricelist[0]["prices"][0][item], pricelist_id: pricelistAR.id)
    end

    redirect_to '/pricelists'
  end

  def getMenu
    prices = Price.all
    render json: prices.to_json
  end

  def generateReceipt
    #for testing fake json is created here rather than being passed in.
    #orderJ = params[:orderdata]
    orderJ = "[{ \"orderName\": \"Jane\",
                 \"tableNumber\": \"1\",
                 \"numberOfCustomers\": \"4\",
                 \"orderItems\":[{\"Cafe Latte\": 2,
                                  \"BlueBerry Muffin\": 1

                }]
              }]"
    order = JSON.parse(orderJ)
    pricelist = Pricelist.first
    #this method the picture will not be able to be passed
    receipt = build_receipt(order, pricelist)

    #by the time of the render the padding function is not working (it works to this oint)
    render json: receipt.to_json
  end

end
