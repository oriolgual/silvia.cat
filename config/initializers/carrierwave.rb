CarrierWave.configure do |config|
  config.permissions = 0666
  if Rails.env.production?
    config.storage = :s3
    config.s3_access_key_id = ENV['AWS_ACCESS_KEY_ID']
    config.s3_secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
    config.s3_region = ENV['AWS_REGION']
    config.s3_bucket = ENV['AWS_UPLOADS_BUCKET']
  else
    config.storage = :file
    CarrierWave.root = Rails.root.join(Rails.public_path).to_s
  end
  config.cache_dir = "#{Rails.root}/tmp/uploads"
end
