class CashRegister
  attr_accessor :total, :discount, :title, :price, :quantity, :last_item
  
  @@items = []
  
  def initialize (discount = 0)
    @total = 0
    @discount = discount
    @@items = []
  end
  
  def add_item (title, price, quantity = 1)
    @last_item = [title, price, quantity]
    @total += price * quantity
    while quantity > 0
      @@items << title
      quantity -= 1
    end
    
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
  
  def void_last_transaction
    @total -= @last_item[1] * @last_item[2]
    while @last_item[2] > 0
      @@items.pop
      quantity -= 1
    end
    @total
  end
end
