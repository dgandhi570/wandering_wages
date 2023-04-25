# app/graphql/mutations/create_post.rb
module Mutations
    class CreateUser < Mutations::BaseMutation
      graphql_name "CreateUser"
      argument :first_name,String, required: true
      argument :last_name,String, required: true
      argument :email,String, required: true
      argument :phone,String, required: true
      argument :city, String
      argument :state, String
      field :user, Types::UserType, null: false
      field :errors, [String], null: false
  
      def resolve(first_name:, last_name:, email:, phone:, city:, state: )
        user = User.new(first_name: first_name, last_name: last_name, email: email, phone: phone, city: city, state: state)
        if user.save
            {
                user: user,
                errors: []
            }
        else
            {
                user: nil,
                errors: user.errors.full_messages
            }
        end

  
    #   rescue ActiveRecord::RecordInvalid => invalid
    #     GraphQL::ExecutionError.new(
    #       "Invalid Attributes for #{invalid.record.class.name}: " \
    #       "#{invalid.record.errors.full_messages.join(', ')}"
    #     )
      end
    end
  end
