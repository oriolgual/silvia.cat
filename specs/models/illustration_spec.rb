require 'spec_helper'

describe Illustration do
  subject { Illustration.make }

  describe 'validations' do
    it 'is not valid without a name' do
      subject.name = nil

      subject.valid?.must_equal false
      subject.errors[:name].wont_be_empty
    end

    it 'is not valid without a image' do
      subject.remove_image!

      subject.valid?.must_equal false
      subject.errors[:image].wont_be_empty
    end

    it 'is not valid without thumbnail coordinates on update' do
      subject.thumbnail_coordinates = nil
      subject.save

      subject.valid?.must_equal false
      subject.errors[:thumbnail_coordinates].wont_be_empty
    end
  end

  describe 'relations' do
    it 'has and belongs to many tags' do
      %w(tag_ids tag_ids= tags tags=).each do |method|
        subject.must_respond_to(method)
      end
    end
  end

  describe 'uploaders' do
    it 'has an image uploader mounted' do
      subject.image.must_be_kind_of ImageUploader
    end
  end

  describe 'serialization' do
    it 'serializes thumbnail_coordinates' do
      subject.serialized_attributes.keys.must_include 'thumbnail_coordinates'
    end

    it 'serializes thumbnail_coordinates as a Hash' do
      subject.thumbnail_coordinates = [0, 0, 100, 100, 100, 100]
      subject.save!

      Proc.new {
        Illustration.find(subject.id)
      }.must_raise ActiveRecord::SerializationTypeMismatch

    end
  end
end
