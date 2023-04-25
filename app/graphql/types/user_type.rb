
# app/graphql/types/user_type.rb
module Types
    class UserType < Types::BaseObject
      field :id, ID, null: false
      field :email, String, null: false
      field :first_name, String, null: false
      field :last_name, String, null: false
      field :phone, String, null: false
      field :state, String
      field :city, String
      field :full_name, String, null: false
    #   field :posts, [Types::PostType], null: true
      
      def full_name
        "#{object.first_name} #{object.last_name}"
      end
    end
  end