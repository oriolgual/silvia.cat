# Syntax
We will be using the [Ruby Mendicant University](https://github.com/rmu/wiki/wiki/Style-Guide) style guide as a code style reference, please take a look at it.

Also, the new Ruby 1.9 hash syntax is preferred:

``` ruby
my_hash = { a: 'apple', b: 'banana' }
```

Instead of:

``` ruby
my_hash = { :a => 'apple', :b => 'banana' }
```

# Git flow
Inspired by [this article](http://reinh.com/blog/2009/03/02/a-git-workflow-for-agile-teams.html) about an agile git workflow (see also the [nvie guide](http://nvie.com/posts/a-successful-git-branching-model/)) we
will be using a git workflow together with Pivotal stories in order to have a dev workflow.

There are two main branches: *master* and *develop*. Master should only be used to merge from develop and is the branch used to deploy code to staging/production. Develop is used to merge features and other hotfixes,
but is also considered a stable branch (ie. no failing tests).

When starting a new feature, you should create a new branch from develop and start working in your branch. Remember, commit and rebase from develop often. Example of a typicial workflow:

``` bash
git checkout -b feature/story # (Use a branch name relevant to the story: "User should be able to register as a freelancer" -> "feature/user_registers_as_a_freelancer"_)
... # Do some work and commits
git fetch # (important, only fetch from develop, don't merge!)
git rebase -i origin/develop
... # Do some work and commits
git push origin feature/story # (You may need to force the push when you've rebased to develop, it's OK since this is only your feature branch, but never force a push to develop nor master).
```

Once you've finished your work in your own branch:

1. Make sure your branch is up-to-date with develop (ie. rebase).
2. Check that the full test suite is green (both unit/integration).
3. Fix possible regression tests.
4. Push your last changes to Github.
5. Open a pull request at Github asking to merge your branch to develop. Refer to the Pivotal story in the pull request description so everyone knows what's your feature about.
6. Notify the team that you've ended your feature so everything gets a code review.
7. Fix your code if there are any comments in you pull request (double check that these changes don't break any tests).
8. Repeat 6-7 until there's an agreement.
9. Merge and close the pull request to develop using Github merge button
10. Delete the remote branch: $ git push origin :branchname

# RVM

Please, check the [RVM website](https://rvm.beginrescueend.com/) if you haven't installed it yet.

The project has a .rvmrc file to automatically set the ruby version (1.9.2) and gemset (cyfler). A problem with Rails 3 and Ruby 1.9.2 is the boot time, and this becomes really annoying when running tests.
To solve it, we're going to use a patched version of Ruby 1.9.2 to solve the boot time issue. This are the instructions to install the patch:

``` bash
curl https://raw.github.com/gist/1008945/7532898172cd9f03b4c0d0db145bc2440dcbb2f6/load.patch > /tmp/load.patch
rvm get head   # always good to make sure you're up to date with RVM
rvm reload
rvm install ruby-1.9.2-p180 --patch /tmp/load.patch -n patched
rvm use ruby-1.9.2-p180-patched
````
More information about this topic:

http://rhnh.net/2011/05/28/speeding-up-rails-startup-time
http://www.rubyinside.com/get-edge-ruby-faster-loading-ruby-1-9-2-now-4973.html

# Bundler

Not much to say about bundler, is the standard gem dependency management nowadays. Some tips:

1. Use bundle install --binstubs: This way the binaries of the gems in the project are linked at the bin dir. Since the rvmrc adds this folder to the path, you don't need to run everything with bundle exec.
2. **Never** run a general bundle update, just update the gems you *really* need to update.
3. Think twice before adding a new gem to the Gemfile (do you really need it? does it have a full green test suite? when was the last update?)
4. If a gem is only needed in development or test, please use groups (we want as least gems as possible at production)

# Locales

As suggested in the [Rails I18n API guide](http://guides.rubyonrails.org/i18n.html#organization-of-locale-files) the locales will be splitted in different files and folders, according to its language and scope. This is the proposed folder tree:

    .
    ├── helpers (Used for Rails default helper locales: en.helpers.submit.create)
    ├── mailers (replicate app/mailers folder tree)
    ├── models
    │   └── model
    │       ├── cn.yml
    │       └── en.yml
    ├── vendor
    │   ├── another_gem
    │   ├── devise
    │   └── kaminari
    └── views (replicate app/views folder tree)

# Gems
1. [Devise](https://github.com/plataformatec/devise) Defacto authentication solution
2. [Inherited Resource](https://github.com/josevalim/inherited_resources) RESTful controllers on diet! (Please take your time to read the documentation and code if you're not familiar with it.)
3. [Carrierwave](https://github.com/jnicklas/carrierwave) File upload solution + [fog](https://github.com/geemus/fog) cloud storage
4. [Simple Form](https://github.com/plataformatec/simple_form) Easier forms for Rails
5. [Slim](https://github.com/stonean/slim) The best and fastest template framework
6. [Compass](https://github.com/chriseppstein/compass/) Easier stylesheets
7. [Simple Navigation](https://github.com/andi/simple-navigation) Great way to create differrent navigation levels
8. [Kaminari](https://github.com/amatsuda/kaminari) Pagination for Rails 3

## Development gems
1. SQLite - Much easier to setup in development and test than Postgres

## Testing gems
1. [Minitest](https://github.com/seattlerb/minitest) TestUnit for Ruby 1.9 with spec syntax ([cheatsheet](http://cheat.errtheblog.com/s/minitest/1)) +  [Turn](https://github.com/TwP/turn) better test/unit reporter + [Mocha](https://github.com/floehopper/mocha) mocking and stubbing
2. [Cucumber](https://github.com/cucumber/cucumber) BDD! + [launchy](https://github.com/copiousfreetime/launchy) helps inspecting generated HTML + [database_cleaner](https://github.com/bmabey/database_cleaner) clean the DB when testing
3. [Machinist](https://github.com/notahat/machinist) Fixture replacement + [Forgery)](https://github.com/sevenwire/forgery) for data generation
4. [Guard](https://github.com/guard/guard) Automatically run tests when changing files
5. [Simplecov](https://github.com/colszowka/simplecov) Code coverage reporter for Ruby 1.9. Remember: 100% test coverage ain't enough!

# Organizing models and specs
Models and corresponding specs must mantain an order:

``` ruby
class User < ActiveRecord::Base

  # Relations
  ...

  # Validations
  ...

  # Callbacks
  ...

  # Other
  ...

  # Class methods
  class << self
    # This is my class method that does cool things.
    #
    # @return [Boolean] if either it's cool or not
    #
    def my_class_method
      ...
    end
  end

  # Instance methods
  ...

  # Protected instance methods
  protected
  ...

  # Private instance methods
  private
  ...
end
```

# Documentation
Not only 100% test coverage ain't enough, we also need 100% documentation. There's no need to write big explanations about some methods. Just note why this method is there and what is doing.

# Writing cucumbers
Some rules:

1. Never ever include CSS selectors in a step definition
2. Then steps must only contain assertions, no other type of actions.
3. Abstraction is your friend
4. When writing scenarios, assume you are in the page to perform the action. Write another scenario on how to get there (navigation scenarios).
