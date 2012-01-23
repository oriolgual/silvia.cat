require 'fast_spec_helper'
require 'friendly_id'
require 'globalize3'
require_concern 'globalize_extensions'
require_model 'category'
require_uploader 'image_uploader'
require_service 'thumbnailer'
require_model 'illustration'

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

  describe 'delegations' do
    it 'delegates the category name to the category' do
      subject.category = Category.new(name: 'Artwork')

      subject.category_name.must_equal 'Artwork'
    end

    it 'allows delegation with nil categories' do
      subject.category = nil

      subject.category_name.must_equal nil
    end
  end

  describe 'relations' do
    it 'belongs to a category' do
      %w(category_id category_id=).each do |method|
        subject.must_respond_to(method)
      end
    end
  end

  describe 'scopes' do
    describe 'by_category' do
      it 'includes illustrations from a given category' do
        category = Category.make!
        illustration = Illustration.make!(category: category)

        Illustration.by_category(category).must_include illustration
      end

      it 'does not include illustrations from a other categoris' do
        category = Category.make!
        another_category = Category.make!
        illustration = Illustration.make!(category: another_category)

        Illustration.by_category(category).wont_include illustration
      end
    end
  end

  describe 'translations' do
    it 'translaters setters in catalan' do
      subject.respond_to?(:name_ca=).must_equal true
      subject.respond_to?(:description_ca=).must_equal true
    end

    it 'translaters setters in spanish' do
      subject.respond_to?(:name_es=).must_equal true
      subject.respond_to?(:description_es=).must_equal true
    end
  end
end
