CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      :provider               => 'AWS',       # required
      :aws_access_key_id      => 'AKIAI4FBVO6MR5QNXKKA',       # required
      :aws_secret_access_key  => '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',       # required
      :region                 => 'us-east-1'  # optional, defaults to 'us-east-1'
    }
    config.fog_directory  = 'gradcliffe82' # required
    # see https://github.com/jnicklas/carrierwave#using-amazon-s3
    # for more optional configuration
    config.fog_public = false
  
  end