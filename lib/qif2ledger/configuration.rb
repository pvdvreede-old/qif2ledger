require 'yaml'

module Qif2ledger
  class Configuration
    def initialize(config_handle, import_file_name)
      @config_handle = config_handle
      @import_file_name = import_file_name
    end

    def template
      @template ||= config_for_file['template']
    end

    private

    def config_for_file
      config.each do |file_conf|
        if Regexp.new(file_conf['file_regex']).match(@import_file_name)
          return defaults.merge(file_conf)
        end
      end
    end

    def defaults
      {
        'template' => "<%=date%> * <%=description%>\n  <%=source%>    <%=amount%>\n  <%=destination%>"
      }
    end

    def config
      @config ||= YAML.load(@config_handle.read)
    end
  end
end
