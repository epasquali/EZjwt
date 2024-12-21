SECRET_KEY = Rails.application.credentials.secret_key_base.to_s

DEFAULT_EXPIRATION = 24.hours.from_now