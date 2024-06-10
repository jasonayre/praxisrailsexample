# frozen_string_literal: true

module V1
  module Resources
    class User < Base
      model ::User # Change it if it maps to a different DB model class

      # Define the name mapping from API filter params, to model attribute/associations
      # when they aren't 1:1 the same
      # filters_mapping(
      #   'label': 'association.label_name'
      # )

      # Add dependencies for resource attributes to other attributes and/or model associations
      # property :href, dependencies: %i[id]

      def self.create(payload)
        # Assuming the API field names directly map the the model attributes. Massage if appropriate.
        self.new(model.create(**payload.to_h))
      end

      def update(payload:)
        # Assuming the API field names directly map the the model attributes. Massage if appropriate.
        record.update(**payload.to_h)
        self
      end

      def delete
        record.destroy
        self
      end
  
    end
  end
end