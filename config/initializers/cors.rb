Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
        origins '*'
        resources '*',
            headers: :any,
            methods: [:get, :post, :delete, :patch, :put, :options, :head]
    end

end 
