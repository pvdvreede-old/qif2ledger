module Qif2ledger
  class LedgerDestination
    def initialize(file_handle)
      @file = file_handle
    end

    def write(template)
      @file.write(template)
    end

    def close
      # no op
    end
  end
end
