# Refactoring Workshop

Requirements: Ruby >1.9.3, git, `bundler` gem.

Then run:

```bash
$ bundle install
```

to install required gems to test.

These are `rake`,`rspec`and `minitest`.

Each folder is named after the refactoring pattern they tackle, and contains:

* `app.rb` code we'll refactor.
* `setup.rb` necessary code for `app.rb` to run (mimicks a SUPER BASIC Rails)
  We don't need to see/edit it unless just curious. :-)
* `tests.rb` self explanatory. Necessary for daily life, specially for
  refactoring.

The specs folder similarly, contains test files for each pattern.

You may run tests by running `tests.rb` or `app.rb` files, like:

```bash
$ ruby app.rb
Run options: --seed 53634

# Running:
..

Finished in 0.001191s, 1679.2611 runs/s, 3358.5223 assertions/s.

2 runs, 4 assertions, 0 failures, 0 errors, 0 skips
```

or by running the command:
```bash
$ rake
```

This will going to run all the tests using rspec. if you want to run them individually it's just a matter to run:

```bash
$ rspec spec/**_spec.rb
```

# Refactoring Patterns

## 1. Intention Revealing Method

## 2. Special Case Object

## 3. Replace Method with Method Object

Implementation note: folder contains two fixture files needed for tests,
`fixtures/input.csv` and `fixtures/output.csv`, and doesn't include `setup.rb`.

## 4. Service Object


# Slides

Open up `en_slides/index.html` in the browser.


# In Spanish

[Spanish version of this doc available](https://github.com/tute/refactoring-workshop/blob/master/README.es.md).
