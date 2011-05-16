require 'dozuki'
require 'dozuki-mapper/proxy'
module Dozuki
  module Mapper
    def self.included(base)
      base.extend(ClassMethods)
    end
    def map_from(node)
      self.class.mapper.call Proxy.new(self, node)
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
          instance.map_from(node)
        end
      end
    end
  end
end
