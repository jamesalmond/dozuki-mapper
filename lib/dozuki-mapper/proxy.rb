module Dozuki
  module Mapper
    class Proxy
      attr_accessor :receiver, :node

      def initialize(receiver, node)
        self.receiver = receiver
        self.node = node
      end

      def string(attribute)
        self.receiver.send("#{attribute}=", node.string("./#{attribute}"))
      end

    end
  end
end
