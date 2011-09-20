require 'spec_helper'

describe Video do
  subject { Video.make }

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

    it 'is not valid without tags' do
      subject.tags = []

      subject.valid?.must_equal false
      subject.errors[:tags].wont_be_empty
    end
  end

  describe 'relations' do
    it 'has and belongs to many tags' do
      %w(tag_ids tag_ids= tags tags=).each do |method|
        subject.must_respond_to(method)
      end
    end
  end
end
