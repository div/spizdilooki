# If an s3.yml file exists, use the key, secret key, and bucket values from there.
# Otherwise, pull them from the environment.
 S3 = Hash.new
if File.exists?("#{Rails.root}/config/s3.yml")
  S3CONF = YAML.load_file("#{Rails.root}/config/s3.yml")
 
  S3[:key] = S3CONF[Rails.env]['access_key_id']
  S3[:secret] = S3CONF[Rails.env]['secret_access_key']
  S3[:bucket] = S3CONF[Rails.env]['bucket']
  S3_CREDENTIALS = Rails.root.join("config/s3.yml")
else
  S3[:key] = ENV['S3_KEY']
  S3[:secret] = ENV['S3_SECRET']
  S3[:bucket] = ENV['S3_BUCKET']
  S3_CREDENTIALS = { :access_key_id => ENV['S3_KEY'], :secret_access_key => ENV['S3_SECRET'], :bucket =>  ENV['S3_BUCKET'] }
end