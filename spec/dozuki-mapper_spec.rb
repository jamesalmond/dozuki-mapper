require 'spec_helper'

module Dozuki
  describe Mapper do
    let(:node) { mock :node }
    let(:klass){ Class.new }
    before do
      klass.send(:include, Mapper)
    end
    describe "from_node" do
      let(:node) { mock :node }
      let(:instance) { mock :klass }
      let(:proxy) { mock :proxy }
      before do
        Mapper::Proxy.stub(:new).and_return(proxy)
        klass.stub(:new).and_return(instance)
      end
      subject {
        klass.map_with do |arg|
          @called_with = arg
        end
        klass.from_node(node)
      }
      it "should create a new instance of the class" do
        klass.should_receive(:new).and_return(instance)
        subject
      end
      it "should create a new proxy with the node and the mapper" do
        Mapper::Proxy.should_receive(:new).with(instance, node).and_return(proxy)
        subject
      end
      it "should yield the proxy to the block mapped block" do
        subject
        @called_with.should == proxy
      end
      it "should return the instance of the class" do
        subject.should == instance
      end
    end
  end
end
