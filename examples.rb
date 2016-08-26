#self validations

class Person < ApplicationRecord
  validates :name, presence: true
end

Person.create(name: "John Doe").valid? # => true
Person.create(name: nil).valid? # => false

#error messages

class Person < ApplicationRecord
  validates :name, presence: true
end

>> p = Person.new
# => #<Person id: nil, name: nil>
>> p.errors.messages
# => {}

>> p.valid?
# => false
>> p.errors.messages
# => {name:["can't be blank"]}

>> p = Person.create
# => #<Person id: nil, name: nil>
>> p.errors.messages
# => {name:["can't be blank"]}

>> p.save
# => false

>> p.save!
# => ActiveRecord::RecordInvalid: Validation failed: Name can't be blank

>> Person.create!
# => ActiveRecord::RecordInvalid: Validation failed: Name can't be blank

#HELPERS

#checkbox
class Person < ApplicationRecord
  validates :terms_of_service, acceptance: true, message: 'must be abided'
end

#ASSOCIATIONS
class Library < ApplicationRecord
  has_many :books
  validates_associated :books
end

#warning!!   Don't use validates_associated on both ends of your associations. They would call each other in an infinite loop.


#CONFIRMATION

#when need to confirm like email or password

class Person < ApplicationRecord
  validates :email, confirmation: true
end
#form would be
<%= text_field :person, :email %>
<%= text_field :person, :email_confirmation %>


#FORMAT
class Product < ApplicationRecord
  validates :legacy_code, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
end

#LENGTH

class Person < ApplicationRecord
validates :name, length: { minimum: 2 }
  validates :bio, length: { maximum: 500 }
  validates :password, length: { in: 6..20 }
  validates :registration_number, length: { is: 6 }
end



#other common ones
numericality
presence
uniqueness


#STRICT VALIDATIONS...?
class Person < ApplicationRecord
  validates :name, presence: { strict: true }
end


#CONDITIONAL
class Order < ApplicationRecord
  validates :card_number, presence: true, if: :paid_with_card?

  def paid_with_card?
    payment_type == "card"
  end
end

#CUSTOM VALIDATORS





