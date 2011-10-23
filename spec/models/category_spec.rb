require 'fast_spec_helper'
require_model 'category'

describe Category do

  subject { Category.new }

  describe 'validations' do
    it 'is not valid without a name' do
      subject.name = nil

      subject.valid?.must_equal false
      subject.errors[:name].wont_be_empty
    end
  end

  describe 'relations' do
    it 'has many illustrations' do
      %w(illustration_ids illustration_ids= illustrations illustrations=).each do |method|
        subject.must_respond_to(method)
      end
    end
  end

  describe 'scopes' do
    describe 'active' do
      it 'includes active categories' do
        @category = Category.make!(active: true)

        Category.active.must_include @category
      end

      it 'does not include inactive categories' do
        @category = Category.make!(active: false)

        Category.active.wont_include @category
      end
    end
  end
end
