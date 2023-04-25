module Queries
  class User < Queries::BaseQuery
    description 'get user by id'
    
    type Types::UserType, null: false
    argument :id, Integer, required: true
    
    def resolve(id:)
      ::User.find_by(id: id)
    end
  end
end


