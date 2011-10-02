require 'machinist/active_record'

require_relative 'fast_spec_helper'
require_uploader 'image_uploader'
require_model 'illustration'
require_model 'category'
require_model 'video'

Illustration.blueprint do
  name { "Illustration #{sn}" }
  description { "A nice illustration."}
  image { File.open(rails_root + '/support/files/illustration.jpg') }
  category
end

Category.blueprint do
  name { "Category #{sn}" }
end

Video.blueprint do
  name { "Video #{sn}" }
  url  { "http://www.youtube.com/watch?v=uNjIWiocYpg" }
  category
end
