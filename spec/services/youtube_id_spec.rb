require 'fast_spec_helper'
require_service 'youtube_id'

describe YoutubeId do
  it 'extracts the id from short urls' do
    url = 'http://youtu.be/umlGyiI0Pzs'
    YoutubeId.new(url).id.must_equal 'umlGyiI0Pzs'
  end

  it 'extracts the id from long urls' do
    url = 'http://www.youtube.com/watch?v=uNjIWiocYpg'
    YoutubeId.new(url).id.must_equal 'uNjIWiocYpg'
  end

  it 'ignores other params' do
    url = 'http://www.youtube.com/watch?v=uNjIWiocYpg&foo=bar'
    YoutubeId.new(url).id.must_equal 'uNjIWiocYpg'
  end
end
