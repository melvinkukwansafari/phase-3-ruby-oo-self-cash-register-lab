
class CashRegister
    attr_accessor :total, :discount, :items

   
      
  
    def initialize(discount = nil)
      @total = 0.0
      @discount = discount
      @items = []
    end
  
    def add_item(title, price, quantity = 1)
      quantity.times do
        @items << { title: title, price: price }
        @total += price
      end
    end
  
    def apply_discount
      if @discount
        @total *= (100 - @discount) / 100.0
        "After the discount, the total comes to $#{@total.round}."
      else
        "There is no discount to apply."
      end
    end
  
    def items
     

      @items.map {|item| item[:title]}
    end
  
    def void_last_transaction
      last_item = @items.pop
      if last_item
        @total -= last_item[:price]

         # adjust for the case where the last item was added multiple times
         quantity = @items.count { |item| item[:title] == last_item[:title] }
         @total -= last_item[:price] * quantity
      end

      if @items.empty?
        @total = 0.0
      end
      
      @total
    end
  
  
end
