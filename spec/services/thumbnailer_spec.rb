require_relative '../fast_spec_helper'
require_uploader 'image_uploader'
require_service 'thumbnailer'
require_foo
gem 'mocha'
require 'mocha'

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

  describe 'instance methods' do
    describe 'thumbnail_coordinates=' do
      it 'accepts a JSON string and parses it' do
        subject.thumbnail_coordinates = "{\"x\":482,\"y\":44,\"x2\":821,\"y2\":383,\"w\":339,\"h\":339}"
        subject.thumbnail_coordinates.must_be_kind_of Hash
      end
    end

    describe 'can_be_cropped?' do
      it 'returns true if coordinates are valid' do
        subject.thumbnail_coordinates = {'x' => '1', 'y' => '1', 'w' => '100', 'h' => '100'}

        subject.can_be_cropped?.must_equal true
      end

      it 'returns false when there are no coordinates' do
        subject.thumbnail_coordinates = nil

        subject.can_be_cropped?.must_equal false
      end

      it 'returns false when coordinates are not valid' do
        subject.thumbnail_coordinates = {'x' => 'a', 'y' => '-1', 'w' => 'nil', 'h' => nil}

        subject.can_be_cropped?.must_equal false
      end
    end

    describe 'magick_thumbnail_coordinates' do
      it 'returns a string formated for ImageMagick' do
        subject.thumbnail_coordinates = {'x' => '1', 'y' => '10', 'w' => '100', 'h' => '150'}

        subject.magick_thumbnail_coordinates.must_equal "100x150+1+10"
      end
    end

    describe 'thumbnail!' do
      it 'tells the uploader to recreate versions when the thumbnail_coordinates changed' do
        subject.stubs(:thumbnail_coordinates_changed?).returns(true)

        ImageUploader.any_instance.expects(:recreate_versions!).once
        subject.thumbnail!
      end

      it 'does nothing when thumbnail_coordinates have not changed' do
        subject.stubs(:thumbnail_coordinates_changed?).returns(false)

        ImageUploader.any_instance.expects(:recreate_versions!).never
        subject.thumbnail!
      end
    end
  end
end
