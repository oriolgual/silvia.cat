require 'fast_spec_helper'
require_model 'category'
require_model 'video'

describe Video do
  subject { Video.new }

  describe 'validations' do
    it 'is not valid without a name' do
      subject.name = nil

      subject.valid?.must_equal false
      subject.errors[:name].wont_be_empty
    end

    it 'is not valid without a url' do
      subject.url = nil

      subject.valid?.must_equal false
      subject.errors[:url].wont_be_empty
    end

    it 'is not valid without a category' do
      subject.category = nil

      subject.valid?.must_equal false
      subject.errors[:category].wont_be_empty
    end
  end

  describe 'relations' do
    it 'belongs to a category' do
      %w(category_id category_id=).each do |method|
        subject.must_respond_to(method)
      end
    end
  end
end
