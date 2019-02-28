require 'pry'

class Transfer
  # your code here

  def initializes(transfer, sender, receiver )
      @transfer = transfer
      @sender = sender
      @receiver = receiver
      binding.pry
  end
end
