module Qif2ledger
  class TransactionPresenter
    def initialize(transaction)
      @transaction = transaction
    end

    def amount
      @transaction.amount.round(2).to_s
    end

    def date
      @transaction.date.strftime('%Y/%m/%d')
    end
  end
end
