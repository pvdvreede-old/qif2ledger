require 'spec_helper'
require 'qif2ledger/qif_source'

module Qif2ledger
  RSpec.describe QifSource do
    subject do
      described_class.new(qif_file)
    end

    let(:qif_file) do
      StringIO.new <<-QF
        !Type:CCard
        D21/04/15
        T-99.10
        PThe payee1
        M
        ^
        D21/04/15
        T-9.99
        PThe payee 2
        M
        ^
        QF
    end

    it 'yields qif transaction objects' do
      subject.each do |trans|
        expect(trans).to be_a(::Qif::Transaction)
      end
    end
  end
end
