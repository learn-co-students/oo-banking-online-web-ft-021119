require 'pry'

class Transfer
  # your code here

  def initializes(sender, transfer, num)
      @sender = sender
      @transfer = transfer
      @num = num
      binding.pry
  end
end
