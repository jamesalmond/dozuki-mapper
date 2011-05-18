# Dozuki Mapper

A simple DSL for mapping xml documents directly to user-defined classes.
Ideal for API parsing.

## What does it do?

You've got an XML API and you want to model the output in Ruby objects,
parse values to primitives and build a structure. You don't want to write lots of code or XPaths or repeat yourself.
Dozuki-mapper, built on the Dozuki gem, lets you define the mapping
between the XML and the objects, but does little more, meaning you
have control over the definition of your class. It is currently only
suited to reasonably direct mappings as it's being used to model API
responses.

Features can be found in the [features
folder](https://github.com/jamesalmond/dozuki-mapper/tree/master/features).

It's built using the [dozuki gem](https://github.com/jamesalmond/dozuki)

# How do I use it?

    xml = %Q{
    <person>
      <name>John Smith</name>
      <address>1 Main Street</address>
      <post_code>NW1 3ED</post_code>
    </person>
    }

    class Person
      include Dozuki::Mapper

      attr_accessor :name, :address, :post_code

      map_with do |map|
        map.string :name
        map.string :address
        map.string :post_code
      end
    end


    doc = Dozuki::XML.parse(xml)

    person = Person.from_node(doc.get('./person')

Setting the relevant fields on the person object. More conversions (e.g.
integer, float, date) to come.

## Mapping data types

* [String](https://github.com/jamesalmond/dozuki-mapper/tree/master/features/string_mapping.feature)
* [Float](https://github.com/jamesalmond/dozuki-mapper/tree/master/features/float_mapping.feature)
* [Int](https://github.com/jamesalmond/dozuki-mapper/tree/master/features/int_mapping.feature)
* [Date](https://github.com/jamesalmond/dozuki-mapper/tree/master/features/date_mapping.feature)
* [Boolean](https://github.com/jamesalmond/dozuki-mapper/tree/master/features/boolean_mapping.feature)

## Mapping object hierarchies


* [Mapping nodes](https://github.com/jamesalmond/dozuki-mapper/tree/master/features/node_mapping.feature)

Example:

    xml = %Q{
      <plot>
        <name>Tiny Plot</name>
        <dimensions>
          <width>100</width>
          <depth>200</depth>
        </dimensions>
      </plot>
    }

    class Plot
      include Dozuki::Mapper
      attr_accessor :name, :dimensions
      map_with do |map|
        map.string :name
        map.node :dimensions, :as => Dimensions
      end
    end

    class Dimensions
      include Dozuki::Mapper
      attr_accessor :width, :height
      map_with do |map|
        map.int :width
        map.int :height
      end
    end


## Mapping collections

* [Mapping each](https://github.com/jamesalmond/dozuki-mapper/tree/master/features/each_mapping.feature)


## Testing your matchers

* [with RSpec](https://github.com/jamesalmond/dozuki-mapper/tree/master/features/rspec_matchers.feature)


## Contributing to Dozuki Mapper
 
* Fork the project.
* Add tests that cover the new feature or bug fix.
* Make your feature addition or bug fix.
* Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself in another branch so I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## LICENSE:

(The MIT License)

Copyright (c) 2011:

* [James Almond](http://jamesalmond.com)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
