class BankAccount

  attr_reader :name
  attr_accessor :balance, :status

  @@accounts = []

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    @@accounts << self
  end

  def deposit(deposit_amount)
    self.balance += deposit_amount
  end

  def display_balance
    return "Your balance is $#{@balance}."
  end

  def valid?
    self.balance > 0 && self.status == "open"
  end
  def close_account
    self.status = "closed"
    self.balance = 0
  end
end
