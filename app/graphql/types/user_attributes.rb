module Types
    class UserAttributes < Types::BaseInputObject
      description "Attributes for creating or updating a user"
      argument :first_name, String, required: true
      argument :last_name, String, required: true
      argument :email, String, required: true
      argument :phone, Integer, required: false
      argument :city, String
      argument :state, String
    end
  end