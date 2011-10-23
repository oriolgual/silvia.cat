require 'machinist/active_record'
require_relative 'fast_spec_helper'

if defined?(Illustration)
  Illustration.blueprint do
    name { "Illustration #{sn}" }
    description { "A nice illustration."}
    image { File.open(rails_root + '/support/files/illustration.jpg') }
    category
  end
end

if defined?(Category)
  Category.blueprint do
    name { "Category #{sn}" }
  end
end

if defined?(Video)
  Video.blueprint do
    name { "Video #{sn}" }
    url  { "http://www.youtube.com/watch?v=uNjIWiocYpg" }
    category
  end
end
