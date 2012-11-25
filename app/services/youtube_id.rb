class YoutubeId
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def id
    url.split('/').last.gsub('watch?v=','').split('&').first
  end
end
