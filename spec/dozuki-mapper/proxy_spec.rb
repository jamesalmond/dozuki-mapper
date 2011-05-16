require 'spec_helper'
module Dozuki
  module Mapper
    describe Proxy do
      class TestClass < Struct.new(:field, :fields); end

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

      describe "float" do 
        let(:receiver){ TestClass.new }
        let(:node) { mock :node}
        let(:method_name){:field}
        let(:float) { 503.0 }

        before do
          node.stub(:float).and_return(float)
        end

        subject { Proxy.new(receiver, node).float(method_name) }
        it "should get the field from the node using the xpath ./field as an float" do
          node.should_receive(:float).with('./field').and_return(float)
          subject
        end

        it "should set the field on the receiver with the float" do
          subject
          receiver.field.should == float
        end
      end

      describe "boolean" do 
        let(:receiver){ TestClass.new }
        let(:node) { mock :node}
        let(:method_name){:field}

        before do
          node.stub(:boolean).and_return(true)
        end

        subject { Proxy.new(receiver, node).boolean(method_name) }
        it "should get the field from the node using the xpath ./field as a boolean" do
          node.should_receive(:boolean).with('./field').and_return(boolean)
          subject
        end

        it "should set the field on the receiver with the boolean" do
          subject
          receiver.field.should == true
        end
      end

      describe "node" do
        let(:node) { mock :node }
        let(:receiver){ TestClass.new }
        let(:method_name){ :field }
        let(:other_class) { mock :class }
        let(:new_object) { mock :new_object }

        before do
          node.stub(:get).and_return(node)
          other_class.stub(:from_node).and_return(new_object)
        end

        subject { Proxy.new(receiver, node).node(method_name, :as => other_class) }

        it "should get the node from the receiver using the ./field xpath" do
          node.should_receive(:get).with('./field').and_return(node)
          subject
        end
        it "should create a new instance of the other class suing from_node" do
          other_class.should_receive(:from_node).with(node).and_return(new_object)
          subject
        end
        it "should set the new object to the field" do
          subject
          receiver.field.should == new_object
        end
      end

      describe "each" do
        let(:node) { mock :node }
        let(:receiver){ TestClass.new(nil, []) }
        let(:other_class){ mock :other_class }
        let(:new_object) { mock :new_object }
        let(:field){ mock :field }

        before do
          node.stub(:each).and_yield(field)
          other_class.stub(:from_node).and_return(new_object)
        end

        subject { Proxy.new(receiver, node).each(:field, :as => other_class, :to => :fields)}

        it "should get each field from the node using the ./field xpath" do
          node.should_receive(:each).with('./field').and_yield(field)
          subject
        end
        it "should create a new instance of the other class using the from_node method" do
          other_class.should_receive(:from_node).with(field).and_return(new_object)
          subject
        end
        it "should append the object to the as field" do
          subject
          receiver.fields.should == [new_object]
        end
      end

    end
  end
end
