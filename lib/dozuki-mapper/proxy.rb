module Dozuki
  module Mapper
    class Proxy
      attr_accessor :receiver, :from_node

      def initialize(receiver, node)
        self.receiver = receiver
        self.from_node = node
      end

      def string(attribute)
        self.receiver.send("#{attribute}=", from_node.string("./#{attribute}"))
      end

      def int(attribute)
        self.receiver.send("#{attribute}=", from_node.int("./#{attribute}"))
      end

      def date(attribute)
        self.receiver.send("#{attribute}=", from_node.date("./#{attribute}"))
      end

      def float(attribute)
        self.receiver.send("#{attribute}=", from_node.float("./#{attribute}"))
      end

      def node(attribute, opts={})
        self.receiver.send("#{attribute}=", opts[:as].from_node(from_node.get("./#{attribute}")))
      end

    end
  end
end
