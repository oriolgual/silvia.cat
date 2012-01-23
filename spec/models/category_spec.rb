require 'fast_spec_helper'
require 'friendly_id'
require 'globalize3'
require_concern 'globalize_extensions'
require_model 'category'
require_uploader 'image_uploader'
require_service 'thumbnailer'
require_model 'illustration'
require_model 'video'

describe Category do

  subject { Category.new }

  describe 'validations' do
    it 'is not valid without a name' do
      subject.name = nil

      subject.valid?.must_equal false
      subject.errors[:name].wont_be_empty
    end
  end

  describe 'translations' do
    it 'translaters setters in catalan' do
      subject.respond_to?(:name_ca=).must_equal true
    end

    it 'translaters setters in spanish' do
      subject.respond_to?(:name_es=).must_equal true
    end
  end

  describe 'relations' do
    it 'has many illustrations' do
      %w(illustration_ids illustration_ids= illustrations illustrations=).each do |method|
        subject.must_respond_to(method)
      end
    end

    it 'nullifies its children when deleted' do
      subject = Category.make!
      child = Illustration.make!(category: subject)

      subject.destroy

      child.reload
      child.category_id.must_equal nil
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
