require 'erb'

module Qif2ledger
  class Renderer
    def initialize(template)
      @template = template
      @erb = ERB.new(template)
    end

    def process(transaction)
      template(transaction)
    end

    private

    def template(transaction)
      @erb.result(transaction.instance_eval { binding }) + "\n\n"
    end
  end
end
