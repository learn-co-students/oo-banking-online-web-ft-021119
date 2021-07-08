class Transfer
  attr_accessor :sender, :receiver, :status
  attr_reader :amount
  def initialize(sender, receiver, amount)
    @sender, @receiver, @amount = sender, receiver, amount
    @status = 'pending'
  end

  def valid?
    (@sender.valid? && @receiver.valid?) ? true : false
  end

  def execute_transaction
    if (self.valid?) && (self.status == 'pending') && @sender.balance > @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = 'complete'
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if (self.valid?) && (self.status == 'complete')
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = 'reversed'
    end
  end

end #END OF CLASS
