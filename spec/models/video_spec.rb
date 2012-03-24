require 'fast_spec_helper'
require 'friendly_id'
require 'globalize3'
require_concern 'globalize_extensions'
require_uploader 'image_uploader'
require_service 'thumbnailer'
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
