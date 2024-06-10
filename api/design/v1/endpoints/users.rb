# frozen_string_literal: true
require 'praxis'

module V1
  module Endpoints
    class Users
      include Praxis::EndpointDefinition

      media_type MediaTypes::User
      version '1'

      description 'Praxis-generated endpoint for managing Users'

      action :index do
        description 'List Users'
        routing { get '' }
        params do
          attribute :fields, Praxis::Types::FieldSelector.for(MediaTypes::User),
                    description: 'Fields with which to render the result.'
=begin
          # You can use pagination/ordering by enabling the PaginationPlugin, and uncommenting these lines
          attribute :pagination, Praxis::Types::PaginationParams.for(MediaTypes::User)
          attribute :order, Praxis::Extensions::Pagination::OrderingParams.for(MediaTypes::User)
=end
          # # Filter by attributes. Add an allowed filter per line, with the allowed operators to use
          # # Also, remember to add a mapping for each in `filters_mapping` method of Resources::User class
          attribute :filters, Praxis::Types::FilteringParams.for(MediaTypes::User) do
             filter 'first_name', using: ['=', '!='], fuzzy: true
          end
        end
        response :ok, media_type: Praxis::Collection.of(MediaTypes::User)
      end

      action :show do
        description 'Retrieve details for a specific User'
        routing { get '/:id' }
        params do
          attribute :id, required: true
          attribute :fields, Praxis::Types::FieldSelector.for(MediaTypes::User),
                    description: 'Fields with which to render the result.'
        end
        response :ok
        response :not_found
      end

      action :create do
        description 'Create a new User'
        routing { post '' }
        payload reference: MediaTypes::User do
          # List the attributes you accept from the one existing in the User Mediatype
          # and/or fully define any other ones you allow at creation time
          # attribute :name
        end
        response :created
        response :bad_request
      end

      action :update do
        description 'Update one or more attributes of an existing User'
        routing { patch '/:id' }
        params do
          attribute :id, required: true
        end
        payload reference: MediaTypes::User do
          # List the attributes you accept from the one existing in the User Mediatype
          # and/or fully define any other ones you allow to change
          # attribute :name
        end
        response :no_content
        response :not_found
        response :bad_request
      end

      action :delete do
        description 'Deletes a User'
        routing { delete '/:id' }
        params do
          attribute :id, required: true
        end
        response :no_content
        response :not_found
      end
    end
  end
end
