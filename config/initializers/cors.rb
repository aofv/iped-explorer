Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins /\A(http|https):\/\/(.*).athletesofvalor[.]com\z/, /\A(http):\/\/localhost:(.*)\z/

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
