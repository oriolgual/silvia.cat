require 'fast_spec_helper'

require_model 'tag'
require_blueprints

describe Tag do

  subject { Tag.make }

  describe 'validations' do
    it 'is not valid without a name' do
      subject.name = nil

      subject.valid?.must_equal false
      subject.errors[:name].wont_be_empty
    end
  end

  describe 'relations' do
    it 'has and belongs to many illustration' do
      %w(illustration_ids illustration_ids= illustrations illustrations=).each do |method|
        subject.must_respond_to(method)
      end
    end
  end
end
