require 'machinist/active_record'

Video.blueprint do
  name { "Video #{sn}" }
  url  { "http://www.youtube.com/watch?v=uNjIWiocYpg" }
  category
end
