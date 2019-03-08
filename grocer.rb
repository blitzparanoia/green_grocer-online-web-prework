require 'pry'
def consolidate_cart(cart)
  # code here
  cart.each_with_object({}) do |item, result|
    item.each do |food, description|
      if result[food]
        description[:count] += 1
      else
        description[:count] = 1
        result[food] = description
      end
      end
      end
end

def apply_coupons(cart, coupons)
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
  cart.each do |item, description|
    binding.pry
end

#def checkout(cart, coupons)
  # code here
#end