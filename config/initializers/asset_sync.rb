if Rails.env.production?
  AssetSync.configure do |config|
    config.fog_provider = 'AWS'
    config.fog_directory = ENV['FOG_DIRECTORY']
    config.aws_access_key_id = ENV['AWS_ACCESS_KEY_ID']
    config.aws_secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
    config.fog_region = 'eu-west-1'
    config.gzip_compression = true
    config.manifest = true
    config.fail_silently = true
  end
end
