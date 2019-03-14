require 'pry'
class Transfer

  attr_reader :name
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount = 50)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
     @receiver.status && @sender.status ? true : false
     receiver.valid?
     sender.valid?
  end

  def execute_transaction

    if sender.balance > @amount && @status == "pending"
      @sender.withdraw(@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
       "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    execute_transaction
    if self.status = "complete"
    @receiver.withdraw(@amount)
    @sender.deposit(@amount)
    @status = "reversed"
    end
  end
end
