require 'spec_helper'
require 'ostruct'
require 'qif2ledger/transaction_presenter'

module Qif2ledger
  RSpec.describe TransactionPresenter do
    subject do
      described_class.new(qif_transaction)
    end

    let(:qif_transaction) do
      OpenStruct.new(
        amount: 12.129,
        date: Time.new(2012, 04, 03))
    end

    describe '#amount' do
      it 'has two decimal places' do
        expect(subject.amount).to eq '12.13'
      end
    end

    describe '#date' do
      it 'provides the ledger date format' do
        expect(subject.date).to eq '2012/04/03'
      end
    end
  end
end
