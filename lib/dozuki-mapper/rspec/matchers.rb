RSpec::Matchers.define :map do |field|
	chain :to_a do |type|
		@type = type
	end
	chain :to_an do |type|
		@type = type
	end
	chain :to do |to|
		@to = to
	end
	chain :as do |as|
		@as = as
	end
	match do |klass|
		@field = field
		proxy = mock(:proxy).as_null_object
		case @type
			when :node
				matcher = proxy.should_receive(:node)
				matcher.with(field, :as => @as)
			when :each
				matcher = proxy.should_receive(:each)
				matcher.with(field, :to => @to, :as => @as)
			else
				matcher = proxy.should_receive(@type)
				matcher.with field
		end
		klass.mapper.call proxy
		matcher.expected_messages_received?
	end

	failure_message_for_should do |model|
		"Expected #{model.name} to map #{@field} as a #{@type}"
	end
end
