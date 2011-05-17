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

        class Shop
          include Dozuki::Mapper
          map_with do |mapper|
            mapper.string :name
          end
        end

        describe Shop do
          describe "mappings" do
            subject { Shop }
            it { should map(:name).to_a(:string) }
          end
        end
      """
    When I run `rspec matchers/string_spec.rb`
    Then the output should contain "1 example, 0 failures"

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
