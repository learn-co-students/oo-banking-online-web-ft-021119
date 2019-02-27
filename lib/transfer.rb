require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    return true if @sender.valid? && @receiver.valid?
    return false
  end
  
  def execute_transaction
    #binding.pry
    if @status == "pending"
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"
      if @sender.valid? == false
        @status = "rejected"
        return "Transaction #{@status}. Please check your account balance."
      end
    end
  end
  
  def reverse_transfer
    if @status == "complete" || @status == "rejected"
      @sender.balance += amount
      @receiver.balance -= amount
      @status = "reversed"
    end
  end
end
