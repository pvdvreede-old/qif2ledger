require 'kiba'
require 'qif2ledger/qif_source'
require 'qif2ledger/renderer'
require 'qif2ledger/ledger_destination'
require 'qif2ledger/transaction_presenter'

module Qif2ledger
  class Import
    def self.job(source_handle, dest_handle, config)
      Kiba.parse do
        source Qif2ledger::QifSource, source_handle

        transform do |qif_trans|
          TransactionPresenter.new(qif_trans)
        end

        transform Renderer, config.template

        destination Qif2ledger::LedgerDestination, dest_handle
      end
    end
  end
end
