# app/graphql/mutations/update_user.rb
module Mutations
  class UpdateUser < Mutations::BaseMutation
    graphql_name "UpdateUser"
    argument :attributes, Types::UserAttributes, required: true
    argument :id, ID, required: true
    field :user, Types::UserType, null: false

    def resolve(id:, attributes:)
      user = user.find(id)
      user.update(attributes.to_h)
      MutationResult.call(
        obj: { user: user },
        success: "User Upadted Sucessfully!",
        errors: user.errors
      )

    rescue ActiveRecord::RecordInvalid => invalid
      GraphQL::ExecutionError.new(
        "Invalid Attributes for #{invalid.record.class.name}: " \
        "#{invalid.record.errors.full_messages.join(', ')}"
      )
    end
  end
end
