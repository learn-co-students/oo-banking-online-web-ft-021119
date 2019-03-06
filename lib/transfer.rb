class Transfer

#WHAT TRANSFER SHOULD BE ALLOWED TO DO
#Transfer should start in a pending status
#Then go to complete state OR rejected status if the accounts aren't valid
  #validty requires balance > 0, and status = open
#Once completed it can be put into a reversed status.

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      true
    else
      false
    end
  end

  def execute_transaction
    if @sender.balance < @amount || @sender.status == "closed"
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif @status == "complete"
      return @status
    else
      @sender.deposit(@amount * -1)
      @receiver.deposit(@amount)
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.deposit(@amount * -1)
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end

end
