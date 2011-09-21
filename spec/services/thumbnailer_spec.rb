require_relative '../fast_spec_helper'
require_uploader 'image_uploader'
require_service 'thumbnailer'
require_foo

describe Thumbnailer do
  subject { Foo.make }

  describe 'validations' do
    it 'is not valid without a image' do
      subject.remove_image!

      subject.valid?.must_equal false
      subject.errors[:image].wont_be_empty
    end

    describe 'thumbnail_coordinates validation' do
      it 'is not valid without thumbnail coordinates on update if image has not changed' do
        subject.save!

        subject.thumbnail_coordinates = nil

        subject.valid?.must_equal false
        subject.errors[:thumbnail_coordinates].wont_be_empty
      end

      it 'is valid without thumbnail coordinates on update if image has changed' do
        subject.save!

        subject.remove_image!
        subject.image = File.open(rails_root + '/support/files/illustration.jpg')
        subject.thumbnail_coordinates = nil

        subject.valid?.must_equal true
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
        Foo.find(subject.id)
      }.must_raise ActiveRecord::SerializationTypeMismatch
    end
  end
end
