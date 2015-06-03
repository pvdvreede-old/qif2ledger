require 'qif'

module Qif2ledger
  class QifSource
    def initialize(handle)
      @reader = Qif::Reader.new(handle)
    end

    def each
      @reader.each do |trans|
        yield trans
      end
    end
  end
end
