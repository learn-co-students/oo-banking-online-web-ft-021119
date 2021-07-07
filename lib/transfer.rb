require 'pry'
class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount = 0)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending' 
  end 
  
  def valid?
    sender.valid? == true && receiver.valid? == true 
  end 
  
  def execute_transaction
    if self.valid? && sender.balance > @amount && @status == 'pending'
      receiver.deposit(@amount) 
      sender.deposit(@amount*-1)
      @status = 'complete'
    else 
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end 
  end
  
  def reverse_transfer
    if @status == 'complete' 
      receiver.deposit(@amount*-1)
      sender.deposit(@amount)
      @status = 'reversed'
    end
  end 
    
  
end
