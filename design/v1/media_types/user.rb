# frozen_string_literal: true

module V1
  module MediaTypes
    class User < Praxis::MediaType
      identifier 'application/json'

      domain_model 'V1::Resources::User'
      description 'Structural definition of a User'

      attributes do
        attribute :id, Integer, description: 'User identifier'
        # <INSERT MORE ATTRIBUTES HERE>
      end
    end
  end
end

