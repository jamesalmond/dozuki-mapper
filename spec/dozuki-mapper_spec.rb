require 'spec_helper'

module Dozuki
  describe Mapper do
    let(:node) { mock :node }
    let(:klass){ Class.new }
    before do
      klass.send(:include, Mapper)
    end
    describe "mappings" do
      let(:instance) { klass.new }
      let(:proxy) { mock :proxy }
      before { Mapper::Proxy.stub(:new).and_return(proxy) }
      subject {
        klass.map_with do |arg|
          @called_with = arg
        end
        instance.map_from(node)
      }
      it "should create a new proxy with the node and the mapper" do
        Mapper::Proxy.should_receive(:new).with(instance, node).and_return(proxy)
        subject
      end
      it "should yield the proxy to the block mapped block" do
        subject
        @called_with.should == proxy
      end
    end
    describe "from_node" do
      let(:node) { mock :node }
      let(:instance) { mock :klass }
      before do
        klass.stub(:new).and_return(instance)
        instance.stub(:map_from)
      end
      subject { klass.from_node(node) }
      it "should create a new instance of the class" do
        klass.should_receive(:new).and_return(instance)
        subject
      end
      it "should map the instance from the node" do
        instance.should_receive(:map_from).with(node)
        subject
      end
      it "should return the instance of the class" do
        subject.should == instance
      end
    end
  end
end
