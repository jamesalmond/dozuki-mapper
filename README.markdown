# Dozuki Mapper

An attempt at writing a wrapper for mapping XML structures to objects

## What does it do?

At the moment, not much. WIP. Features can be found in the [features
folder](https://github.com/jamesalmond/dozuki-mapper/tree/master/features).

It's built using the [dozuki gem](https://github.com/jamesalmond/dozuki)

# How do I use it?

    class Person
      include Dozuki::Mapper
      attr_accessor :name, :address, :post_code
    end

    xml = %Q{
    <person>
      <name>John Smith</name>
      <address>1 Main Street</address>
      <post_code>NW1 3ED</post_code>
    </person>
    }

    doc = Dozuki::XML.parse(xml)

    person = Person.new
    person.map_from(doc.get('/person')) do |map|
      map.string :name
      map.string :address
      map.string :post_code
    end

Setting the relevant fields on the person object. More conversions (e.g.
integer, float, date) to come.

## Contributing to Dozuki Mapper
 
* Fork the project.
* Add tests that cover the new feature or bug fix.
* Make your feature addition or bug fix.
* Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself in another branch so I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## LICENSE:

(The MIT License)

Copyright (c) 2010:

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
