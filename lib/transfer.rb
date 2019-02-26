require "pry"
class Transfer
  attr_accessor :sender, :receiver, :amount, :status 
  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender 
    @receiver = receiver 
    @amount = amount 
    @status = status 
  end 
  
  def valid? 
    @sender.valid? 
    @receiver.valid? 
  end 
  def execute_transaction
    if @status == "pending" && @amount < @sender.balance
       @status = "complete"
       @sender.balance -= @amount 
       @receiver.balance +=@amount
    else 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end 
  end 
  def reverse_transfer 
    if @status == "complete"
      @status = "reversed"
      @sender.balance += @amount 
      @receiver.balance -=@amount
    end
  end
end
