require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Ne
  class Application < Rails::Application
config.active_record.encryption.support_sha1_for_non_deterministic_encryption = true
    config.load_defaults 7.1
    config.autoload_lib(ignore: %w(assets tasks))
config.active_record.encryption.store_key_references = true
config.active_record.encryption.hash_digest_class = OpenSSL::Digest::SHA256
config.active_record.encryption.support_sha1_for_non_deterministic_encryption = true
    #config.autoload_paths << config.root.join("lib")
    #config.eager_load_paths << config.root.join("lib")
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
