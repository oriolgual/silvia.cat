require 'machinist/active_record'

Category.blueprint do
  name { "Category #{sn}" }
end
