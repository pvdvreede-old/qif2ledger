require 'spec_helper'
require 'qif2ledger/ledger_destination'

module Qif2ledger
  RSpec.describe LedgerDestination do
    subject do
      described_class.new(ledger_file)
    end

    let(:ledger_file) do
      StringIO.new
    end

    let(:transaction) do
      "test template"
    end

    before do
      subject.write(transaction)
      ledger_file.rewind
    end

    it 'writes the templated transaction to the file handle' do
      expect(ledger_file.read).to eq "test template"
    end
  end
end
