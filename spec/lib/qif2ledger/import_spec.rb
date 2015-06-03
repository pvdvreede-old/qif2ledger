require 'spec_helper'
require 'qif2ledger/import'

module Qif2ledger
  RSpec.describe 'The ETL' do
    let(:qif) do
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

    let(:ledger) do
      StringIO.new
    end

    let(:config) do
      double('config', template: "<%=date%>")
    end

    before do
      Kiba.run(Import.job(qif, ledger, config))
      ledger.rewind
    end

    it 'writes two transactions to the ledger file' do
      expect(ledger.read).to eq "2015/04/21\n\n2015/04/21\n\n"
    end
  end
end
