class CashRegister
  attr_accessor :total, :discount, :title, :price, :quantity
  
  @@items = []
  
  def initialize (discount = 0)
    @total = 0
    @discount = discount
  end
  
  def add_item (title, price, quantity = 1)
    @total += price * quantity
    @@items << title * quantity
  end
  
  def apply_discount

    if @discount > 0
      float_discount = (100.0-@discount)/100.0
      @total = @total*float_discount
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end
  
  def items
    @@items
  end
end
