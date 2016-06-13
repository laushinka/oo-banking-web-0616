class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount=50)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? == true
    receiver.valid? == true
  end

  def execute_transaction
    if sender.valid? && receiver.valid? && sender.balance > amount && @status == "pending"
      receiver.balance += @amount
      sender.balance -= @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
    # execute ? sender.valid? == false && receiver.valid? == true && sender.balance > @amount : reject
    # if sender.balance > receiver.balance
      # unless sender.valid? == false
  end

  def reverse_transfer
    if @status == "complete" && sender.valid? == true && receiver.valid? == true
      sender.balance += @amount
      receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
