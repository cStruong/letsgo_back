class ExpenseItemSerializer < ActiveModel::Serializer
    belongs_to :trip
    
    attributes :id, :name, :estimated_cost, :trip_id
end
