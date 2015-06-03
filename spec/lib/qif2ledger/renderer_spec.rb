require 'spec_helper'
require 'ostruct'
require 'qif2ledger/renderer'

module Qif2ledger
  RSpec.describe Renderer do
    subject do
      described_class.new(template)
    end

    let(:transaction) do
        OpenStruct.new(
          description: "first",
          amount: "10.00",
          date: "2012/02/02",
          source: 'source1',
          destination: 'dest1')
    end

    let(:template) do
      "<%=date%> * <%=description%>\n  <%=source%>    <%=amount%>\n  <%=destination%>"
    end

    it 'yields the first ledger item string templated' do
      expect(subject.process(transaction)).to eq "2012/02/02 * first\n  source1    10.00\n  dest1\n\n"
    end
  end
end
