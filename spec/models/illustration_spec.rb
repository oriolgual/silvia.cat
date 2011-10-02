require_relative '../fast_spec_helper'
require_service 'thumbnailer'
require_blueprints

describe Illustration do
  subject { Illustration.new }

  it 'has thumbnailing support' do
    Illustration.ancestors.must_include Thumbnailer
  end

  describe 'validations' do
    it 'is not valid without a name' do
      subject.name = nil

      subject.valid?.must_equal false
      subject.errors[:name].wont_be_empty
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
