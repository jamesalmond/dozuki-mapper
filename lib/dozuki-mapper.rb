require 'dozuki'
require 'dozuki-mapper/proxy'
module Dozuki
  module Mapper
    def self.included(base)
      base.extend(ClassMethods)
    end
    module ClassMethods
      def map_with(&blk)
        @mapper = blk
      end
      def mapper
        @mapper
      end
      def from_node(node)
        new.tap do |instance|
          mapper.call Proxy.new(instance, node)
        end
      end
    end
  end
end
