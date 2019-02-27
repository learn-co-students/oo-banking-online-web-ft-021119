class BankAccount
  attr_accessor :balance, :status
  attr_reader :name
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
  
  def deposit(balance)
    @balance += balance
  end
  
  def display_balance
    return "Your balance is $#{@balance}."
  end
  
  def valid?
    return true if @balance > 0 && @status == "open"
    return false
  end
  
  def close_account
    @status = "closed"
  end
end
