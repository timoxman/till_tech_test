module PricelistsHelper

  def build_receipt(order, pricelist)
    receipt =[]
    receipt.push(receipt_timestamp)
    receipt.push(pricelist.shopName)
    receipt.push(" ")
    receipt.push(pricelist.address)
    receipt.push(format_phone(pricelist.phone))
    receipt.push("Table:   #{order[0]["tableNumber"]} / [#{order[0]["numberOfCustomers"]}]")
    receipt.push(order[0]["orderName"])

    order[0]["orderItems"][0].keys.each do | menu_item |
      receipt.push("  #{menu_item}#{padding(menu_item)} X")
    end

    return receipt
  end


  def format_phone(phone_no)
    "Phone: +#{phone_no[0]} (#{phone_no[1..3]}) #{phone_no[4..6]}-#{phone_no[7..-1]} "
  end


  def receipt_timestamp()
    time = Time.new.to_a
    "#{time[5]}.#{add_zero(time[4])}.#{add_zero(time[3])} #{add_zero(time[2])}:#{add_zero(time[1])}:#{add_zero(time[0])}"
  end


  def add_zero(num)
    if num < 10
      "0#{num}"
    else
      num.to_s
    end
  end


  def padding(text)
    return_padding = ""
    (25 - text.length).times do
      return_padding += " "
    end
    return_padding
  end


end
