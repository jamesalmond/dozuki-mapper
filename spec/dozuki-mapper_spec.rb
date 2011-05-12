require 'spec_helper'

module Dozuki
  describe Mapper do
    let(:node) { mock :node }
    let(:klass){ Class.new }
    let(:instance) { klass.new }
    let(:proxy) { mock :proxy }
    before { Mapper::Proxy.stub(:new).and_return(proxy) }
    subject {
      klass.send(:include, Mapper)
      instance.map_from(node) do |arg|
        @called_with = arg
      end
    }
    it "should create a new proxy with the node and the mapper" do
      Mapper::Proxy.should_receive(:new).with(instance, node).and_return(proxy)
      subject
    end
    it "should yield the proxy to the method call" do
      subject
      @called_with.should == proxy
    end
  end
end
