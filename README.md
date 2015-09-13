# Refactoring Workshop

Requirements: Ruby >= 2.0, git, `minitest` gem.

Each folder is named after the refactoring pattern they tackle, and contains:

* `app.rb` code we'll refactor.
* `setup.rb` necessary code for `app.rb` to run (mimicks a SUPER BASIC Rails)
  We don't need to see/edit it unless just curious. :-)
* `tests.rb` self explanatory. Necessary for daily life, specially for
  refactoring.

Run `bundle` to make sure you have the gems needed for running tests (`rake`
and `minitest`).

Run tests running `rake`:

```bash
$ rake
Run options: --seed 61694

# Running:

..........

Finished in 0.016857s, 593.2254 runs/s, 1423.7409 assertions/s.

10 runs, 24 assertions, 0 failures, 0 errors, 0 skips
```

# Refactoring Patterns

## 1. Intention Revealing Method

## 2. Special Case Object

## 3. Replace Method with Method Object

Implementation note: folder contains two fixture files needed for tests,
`fixtures/input.csv` and `fixtures/output.csv`, and doesn't include `setup.rb`.

## 4. Service Object


# Slides

* [RubyConf Argentina Slides](http://es.slideshare.net/thoughtbot/refactoring-workshop-rubyconf-argentina-2014)
* [RailsConf Slides](http://www.slideshare.net/tutec/simplifying-code-monster-to-elegant-in-n-5-steps)

# In Spanish

[Spanish version of this doc available](https://github.com/tute/refactoring-workshop/blob/master/README.md).
