class PricelistsController < ApplicationController

    def index

      if Pricelist.count > 0
        @message = "Pricelist found"
      else
        @message = "No Pricelist yet"
      end
    end

    def new
      # this should really be in 'create' but can't get it there!
      json_file = File.read('hipstercoffee.json')
      byebug
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
    redirect_to '/pricelists'
  end

  def getmenu
    prices = Price.all
    render json: prices.to_json
  end

  def generatereceipt
    #orderJ = params[:orderdata]
    orderJ = "[{ \"orderName\": \"Jane\",
                 \"tableNumber\": \"1\",
                 \"numberOfCustomers\": \"4\",
                 \"orderItems\":[{\"Cafe Latte\": 2,
                                  \"BlueBerry Muffin\": 1

                }]
              }]"
    order = JSON.parse(orderJ)

    #this method the picture will not be able to be passed
    #line returns not working
    receipt =[]
    receipt.push(receipt_timestamp)
    receipt.push(Pricelist.first.shopName)
    receipt.push(" ")
    receipt.push(Pricelist.first.address)
    receipt.push(format_phone(Pricelist.first.phone))
    receipt.push("Table:   #{order[0]["tableNumber"]} / [#{order[0]["numberOfCustomers"]}]")
    render json: receipt.to_json
  end


  def format_phone(phone_no)
    "Phone: +#{phone_no[0]} (#{phone_no[1..3]}) #{phone_no[4..6]}-#{phone_no[7..-1]} "
  end

  def receipt_timestamp()
  end


end
