require 'spec_helper'
module Dozuki
  module Mapper
    describe Proxy do
      class TestClass < Struct.new(:field); end
      describe "initialization" do
        let(:receiver){ mock :receiver }
        let(:node){ mock :node }
        subject { Proxy.new(receiver, node)}
        its(:receiver){ should == receiver }
        its(:node) { should == node }
      end

      describe "string" do
        let(:receiver){ TestClass.new }
        let(:node) { mock :node}
        let(:method_name){:field}
        let(:string) { "The Decemberists" }

        before do
          node.stub(:string).and_return(string)
        end

        subject { Proxy.new(receiver, node).string(method_name) }
        it "should get the field from the node using the xpath ./field as a string" do
          node.should_receive(:string).with('./field').and_return(string)
          subject
        end

        it "should set the field on the receiver with the string" do
          subject
          receiver.field.should == string
        end

      end

      describe "string" do
        let(:receiver){ TestClass.new }
        let(:node) { mock :node}
        let(:method_name){:field}
        let(:int) { 54 }

        before do
          node.stub(:int).and_return(int)
        end

        subject { Proxy.new(receiver, node).int(method_name) }
        it "should get the field from the node using the xpath ./field as an int" do
          node.should_receive(:int).with('./field').and_return(int)
          subject
        end

        it "should set the field on the receiver with the int" do
          subject
          receiver.field.should == int
        end

      end

    end
  end
end
