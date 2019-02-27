class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @receiver = receiver
    @sender = sender
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? == true
    @receiver.valid? == true
  end

  def execute_transaction

    if self.valid? && sender.balance > amount && status == "pending"
      @status = "complete"
      sender.balance -= amount
      receiver.deposit(amount)

    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    # binding.pry
    if @status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    end
  end

end
