require 'fast_spec_helper'
require 'mocha'
require 'globalize'
require_concern 'globalize_extensions'

class TestGlobalizeExtensions
  include GlobalizeExtensions

  def self.translated_attribute_names
    ['name', 'description']
  end

  translate_accessors_in :ca, :es
end

describe GlobalizeExtensions do
  subject { TestGlobalizeExtensions.new }

  describe 'translate_setters_in' do
    it 'define a setter for each translated attribute and locale' do
      subject.respond_to?(:name_ca=).must_equal true
      subject.respond_to?(:name_es=).must_equal true
      subject.respond_to?(:description_ca=).must_equal true
      subject.respond_to?(:description_es=).must_equal true
    end

    it 'defines a getter using Globalize to get the value in a given locale' do
      Globalize.expects(:with_locale).with(:ca)

      subject.name_ca
    end

    it 'defines a getter to get the translated value ' do
      subject.expects(:name).returns('caca')

      subject.name_ca.must_equal 'caca'
    end

    it 'defines a setter using Globalize to set the value in a given locale' do
      Globalize.expects(:with_locale).with(:ca)

      subject.name_ca = 'caca'
    end

    it 'defines a setter to call the original setter' do
      subject.expects(:name=).with('caca')

      subject.name_ca = 'caca'
    end
  end
end
