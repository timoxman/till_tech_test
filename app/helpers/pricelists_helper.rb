module PricelistsHelper

# a receipt is important enough to be its own class/model or stick it in a lib file as a class
  def build_receipt(order, pricelist)
    # should build as a text file and format on front end rather than here.
    receipt =[]
    receipt.push(receipt_timestamp)
    receipt.push(pricelist.shopName)
    receipt.push(" ")
    receipt.push(pricelist.address)
    receipt.push(Pricelist.format_phone(pricelist.phone))
    receipt.push("Table:   #{order[0]["tableNumber"]} / [#{order[0]["numberOfCustomers"]}]")
    receipt.push(order[0]["orderName"])

    order[0]["orderItems"][0].keys.each do | menu_item |
      receipt.push("  #{menu_item}#{padding(menu_item)} #{order[0]["orderItems"][0][menu_item]} x #{item_price(menu_item,pricelist.id)}")
    end

    bill = calculate_order(order[0]["orderItems"][0],pricelist.id)

    receipt.push(" ")
    receipt.push("Disc ")
    receipt.push("Tax #{calculate_tax(bill)}")
    receipt.push("Total #{display_money(bill)}")
    receipt.push("Cash: ")
    receipt.push("Change: ")
    return receipt
  end

  include ActionView::Helpers::NumberHelper

  def receipt_timestamp()
    time = Time.new
    time.strftime("%Y.%m.%d %H:%M:%S")
    # "#{time[5]}.#{add_zero(time[4])}.#{add_zero(time[3])} #{add_zero(time[2])}:#{add_zero(time[1])}:#{add_zero(time[0])}"
  end

  # def add_zero(num)
  #   if num < 10
  #     "0#{num}"
  #   else
  #     num.to_s
  #   end
  # end

#replace with ruby - to do
  def padding(text)
    return_padding = ""
    (25 - text.length).times do
      return_padding += " "
    end
    return_padding
  end

  def item_price(menu_item,id)
    value = Price.find_by(item: menu_item, pricelist_id: id).price
    display_money(value)
  end

  def calculate_order(order,id)
    sum = 0
    order.keys.each do | menu_item |
      sum += Price.find_by(item: menu_item, pricelist_id: id).price * order[menu_item]
    end
    return sum
  end

  def calculate_tax(bill)
    display_money(bill * 0.0864)
  end

#replace with rails helper or if passed as text can be formatted in Angular, Rails helper should be in View.. special code above to bring it here.
  def display_money(value)
    number_to_currency(value, locale: :"en-GB")
    # return_value = '%.2f' % [(value * 100).round / 100.0]
    # return_value = "£" + return_value
  end


end
