require 'dozuki'
require 'dozuki-mapper/proxy'
module Dozuki
  module Mapper
    def map_from(node)
      yield Proxy.new(self, node)
    end
  end
end
