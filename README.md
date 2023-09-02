# Photo library

The app can be used from the command line and expects input from the standard input.

`examples/input.txt` contains sample input content:

```bash
./app.rb < examples/input.txt
```

To invoke the `solution` method directly: 

```ruby
require_relative "lib/photo_organizer"
s = "photo.jpg, Krakow, 2013-09-05 14:08:15\nMike.png, London, 2015-06-20 15:13:22"
solution(s)
```

# Running tests

Tests are written using [rspec](https://github.com/rspec/rspec-core).
To run the test suite, `bundle install` and run the `rspec` command on the root directory.
