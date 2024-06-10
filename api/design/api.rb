Praxis::ApiDefinition.define do
  info do
    name 'example'
    title 'Example APIasdasd'

    # Attributes for OpenAPI docs
    termsOfService 'https://mysitehere.com'
    contact name: 'API Info', email: 'info@mysitehere.com'
    server(
      url: 'https://{host}',
      description: 'My Fancy API Service',
      variables: {
        host: {
          default: 'localhost',
          description: 'Host environment where to point at',
          enum: %w[localhost mysitehere.com],
        },
      },
    )
  end

  puts "THIS IS BEING LOADED"

  # Trait that when included will require a Bearer authorization header to be passed in.
  trait :authorized do
    headers do
      key "Authorization", String, regexp: /^.*Bearer\s/, required: true
    end
  end
end
