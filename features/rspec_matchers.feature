Feature: Spec matchers
  So that I can write simple tests against my mapper
  As a test driven developer
  I want to test my mappings using RSpec


  @matchers
  Scenario: a simple string matcher
    Given a file named "matchers/string_spec.rb" with:
      """
        require 'rspec'
        require 'dozuki-mapper'
        require 'dozuki-mapper/rspec/matchers'

        class Person
          include Dozuki::Mapper
          map_with do |mapper|
            mapper.string :name
            mapper.date :dob
            mapper.boolean :male
            mapper.int :age
            mapper.float :bank_balance
            mapper.node :address, :as => Address
            mapper.each :child, :as => Person, :to => :children
          end
        end

        class Address; end

        describe Person do
          describe "mappings" do
            subject { Person }
            it { should map(:name).to_a(:string) }
            it { should map(:dob).to_a(:date) }
            it { should map(:male).to_a(:boolean) }
            it { should map(:age).to_an(:int) }
            it { should map(:bank_balance).to_a(:float) }
            it { should map(:address).to_a(:node).as(Address)}
            it { should map(:child).to_an(:each).as(Person).to(:children)}
          end
        end
      """
    When I run `rspec matchers/string_spec.rb`
    Then the output should contain "7 examples, 0 failures"

  @matchers
  Scenario: a simple string matcher, that fails
    Given a file named "matchers/failing_string_spec.rb" with:
      """
        require 'rspec'
        require 'dozuki-mapper'
        require 'dozuki-mapper/rspec/matchers'

        class Shop
          include Dozuki::Mapper
          map_with do |mapper|
            mapper.string :name
          end
        end

        describe Shop do
          describe "mappings" do
            subject { Shop }
            it { should map(:giant).to_a(:string) }
          end
        end
      """
    When I run `rspec matchers/failing_string_spec.rb`
    Then the output should contain "1 example, 1 failure"
