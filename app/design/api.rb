puts "CALLING THIS API FILE"
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
end
