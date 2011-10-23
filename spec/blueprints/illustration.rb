require 'machinist/active_record'
require_relative '../fast_spec_helper'

Illustration.blueprint do
  name { "Illustration #{sn}" }
  description { "A nice illustration."}
  image { File.open(rails_root + '/support/files/illustration.jpg') }
  category
end
