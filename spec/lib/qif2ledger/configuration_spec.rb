require 'spec_helper'
require 'qif2ledger/configuration'

module Qif2ledger
  RSpec.describe Configuration do
    subject do
      described_class.new(yaml, file_name)
    end

    let(:file_name) { "test123.qif" }

    let(:yaml) do
      StringIO.new <<-YAML
- file_regex: ^test.*\.qif
  #{template}
      YAML
    end

    context 'with default template' do
      let(:template) do
        ""
      end

      it 'returns the correct template' do
        expect(subject.template).to eq "<%=date%> * <%=description%>\n  <%=source%>    <%=amount%>\n  <%=destination%>"
      end
    end

    context 'with user specified template' do
      let(:template) do
        "template: this is the user template"
      end

      it 'returns the correct template' do
        expect(subject.template).to eq "this is the user template"
      end
    end
  end
end
