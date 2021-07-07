require 'pry'
class BankAccount

  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance =1000
    @status = 'open'
  end

  def deposit(amount)
    # binding.pry
    self.balance=(amount+self.balance)
  end

  def display_balance
    "Your balance is $#{balance}."
  end

  def valid?
    status == 'open' && balance > 0
  end

  def close_account
    # binding.pry
    self.status='closed'
  end


end
