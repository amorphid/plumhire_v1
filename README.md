Testing > Macros
================

* Macros live in spec/support/macros/

Testing > Macros > Some Ruby Objects
=============================

* The SRO module a bucket for random Ruby objects used in testing
* Using [Fabrication](http://www.fabricationgem.org/) doesn't always feel like the right approach

## SRO::ReaderWriter class

When created an SRO::ReaderWriter object adds getters and setters to itself
```ruby
(main)>  rw = SRO::ReaderWriter.new(hello: "world", seeya: nil)
=> #<SRO::ReaderWriter:0x007fed5b9ea638 @hello="world", @seeya=nil>

(main)> rw.hello
=> "world"

(main)> rw.seeya
=> nil

(main)> rw.seeya = "later"
=> "later"

(main)> rw.seeya
=> "later"
```

An SRO::ReaderWriter sets instance variables, unlike an OpenStruct
```ruby
(main)> rw.instance_variables
=> [:@hello, :@seeya]

(main)> os = OpenStruct(hello: "world", seeya: nil)
=> #<OpenStruct hello="world", seeya=nil>

(main)> os.instance_variables
=> [:@table]
```

An SRO::ReaderWriter raises an error when missing method, unlike an OpenStruct
```ruby
(main)> rw.foo
NoMethodError: undefined method `foo' for #<NGR::ReaderWriter:0x007fed5c6cd328 @hello="world", @seeya=nil>

(main)> os.foo
=> nil
```



License
=======

Plumhire is released under the [MIT License](http://www.opensource.org/licenses/MIT).
