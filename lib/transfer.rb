class Transfer
  # your code here

  attr_accessor :status, :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction

    if sender.valid? && self.status != 'complete'
      if sender.balance >= self.amount
        sender.balance -= amount
        receiver.balance += amount
        self.status = 'complete'
      else
        @status = 'rejected'
        return "Transaction rejected. Please check your account balance."
      end
    else
      self.status = 'rejected'
    return "Transaction rejected. Please check your account balance."
    end
  end


  def reverse_transfer
    if self.status == 'complete'
      sender.balance += amount
      receiver.balance -= amount
      @status = 'reversed'
    end      
  end

end
