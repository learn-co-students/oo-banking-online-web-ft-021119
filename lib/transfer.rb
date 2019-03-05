
require 'pry'
class Transfer
  
  attr_reader  :sender, :receiver, :amount
  attr_accessor :status


		  def initialize(sender, receiver, amount)
		  	@sender = sender
		  	@receiver = receiver
		  	@status = "pending"
		  	@amount = amount
		  	#binding.pry
		  end

		  def valid?
		 # binding.pry
		  	 if sender.valid? && receiver.valid? 
		  	 	 return true
		  	 	else false
		  	 	
		  	 end
		  	
			#binding.pry
		  end


		  def execute_transaction
			#binding.pry
			if valid? && sender.balance > self.amount && status == "pending"
		  	 
		  	sender.balance -= self.amount
		  	receiver.balance += self.amount
		  	
		  	@status = "complete"
		  	
		  	else
			
		  	@status = "rejected"
		  	#binding.pry
		  	return "Transaction rejected. Please check your account balance."
		  
		  	
		  end
		end


		def reverse_transfer
		#binding.pry
				if @status == "complete"
					sender.balance += self.amount
					receiver.balance -= self.amount
					@status = "reversed"
				end

		end
		
		
		


  # your code here
end
