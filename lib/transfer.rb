class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
    @completed = false
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && !@completed #&& amount > sender.balance
      if amount <= sender.balance
        receiver.deposit(amount)
        sender.deposit(-amount)
        self.status=('complete')
        @completed = true
      else
          self.status=('rejected')
          return 'Transaction rejected. Please check your account balance.'
        end
    else
      self.status=('rejected')
      return 'Transaction rejected. Please check your account balance.'
    end
  end

  def reverse_transfer
    if self.status == 'complete'
      receiver.deposit(-amount)
      sender.deposit(amount)
      self.status='reversed'
    end
  end
end
