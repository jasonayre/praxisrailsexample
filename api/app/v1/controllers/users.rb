# frozen_string_literal: true

module V1
  module Controllers
    class Users
      include Praxis::Controller

      implements Endpoints::Users

      # Retrieve all Users with the right necessary associations
      # and render them appropriately with the requested field selection
      def index
        objects = build_query(model_class)
        display(objects)
      end

      # Retrieve a single User with the right necessary associations
      # and render them appropriately with the requested field selection
      def show(id:, **_args)
        model = build_query(model_class.where(id: id)).first
        return Praxis::Responses::NotFound.new if model.nil?

        display(model)
      end

      # Creates a new User
      def create
        # A good pattern is to call the same name method on the corresponding resource, 
        # passing the incoming payload, or massaging it first
        created_resource = Resources::User.create(request.payload)

        # Respond with a created if it successfully finished
        Praxis::Responses::Created.new(location: created_resource.href)
      end

      # Updates some of the information of a User
      def update(id:)
        # A good pattern is to retrieve the resource instance by id, and then
        # call the same name method on it, by passing the incoming payload (or massaging it first)
        resource = Resources::User.get(id: id)
        return Praxis::Responses::NotFound.new unless resource

        resource.update(payload: request.payload)
        Praxis::Responses::NoContent.new
      end

      # Deletes an existing User
      def delete(id:)
        # A good pattern is to retrieve the resource instance by id, and then
        # call the same name method on it
        resource = Resources::User.get(id: id)
        return Praxis::Responses::NotFound.new unless resource

        resource.delete
        Praxis::Responses::NoContent.new
      end

      # Use the model class as the base query but you might want to change that
      def model_class
        ::User #Change it to the appropriate DB model class
      end
    end
  end
end