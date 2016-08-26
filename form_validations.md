ways to validate
  -Database:
    *if your database is used by other applications good idea to uses some constraints
    *can safely handle some things (such as heavily-used tables)
  -Cliend-side:
    *can be useful, but are generally unreliable if used alone
    *If  implemented using JavaScript, they may be bypassed if JavaScript is turned off
    *can be a convenient way to provide users with immediate feedback as they use your site
  -Controller-level
    *often become unwieldy and difficult to test and maintain


Methods that will trigger validations and will save
the object to the database only if the object is valid:

    *create
    *create!
    *save
    *save!
    *update
    *update!

 The following methods skip validations, and will save the object
 to the database regardless of its validity

    decrement!
    decrement_counter
    increment!
    increment_counter
    toggle!
    touch
    update_all
    update_attribute
    update_column
    update_columns
    update_counters

*save can skip validations
  save(validate: false)


can run validations tests yourself

class Person < ApplicationRecord
  validates :name, presence: true
end

Person.create(name: "John Doe").valid? # => true
Person.create(name: nil).valid? # => false
