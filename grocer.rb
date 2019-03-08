require 'pry'
def consolidate_cart(cart)
  # code here
  cart.each_with_object({}) do |item, result|
    item.each do |type, attributes|
      if result[type]
        attributes[:count] += 1
      else
        attributes[:count] = 1
        result[type] = attributes
      end
    end
  end
end

def apply_coupons(cart, coupons)
  # code here
  coupons.each do |coupon|
    name = coupon[:item]
    if cart[name] && cart[name][:count] >= coupon[:num]
      if cart["#{name} W/COUPON"]
        cart["#{name} W/COUPON"][:count] += 1
      else
        cart["#{name} W/COUPON"] = {:count => 1, :price => coupon[:cost]}
        cart["#{name} W/COUPON"][:clearance] = cart[name][:clearance]
      end
      cart[name][:count] -= coupon[:num]
    end
  end
  cart
end

def apply_clearance(cart)
  # code here
  cart.each do |item, attributes|
    if attributes[:clearance]
      new_price = attributes[:price] * (0.8)
      attributes[:price] = new_price.round(2)
      
  end
  end
  cart
end

def checkout(cart, coupons)
  # code here
  consolidate_cart = consolidate_cart(cart)
  coupon_cart = apply_coupons(consolidate_cart,coupons)
  end_cart = apply_clearance(coupon_cart)
  total = 0
  end_cart.each do |food, descr|
    total += descr[:price] * descr[:count]
  #binding.pry
end
total = 
end