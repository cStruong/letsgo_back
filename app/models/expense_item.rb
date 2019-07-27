class ExpenseItem < ApplicationRecord
    belongs_to :trip

    validates :name, presence: {message: 'Requires a name/label.'}
    validates :estimated_cost, presence: {message: 'Requires a estimated cost.'}
    validates :estimated_cost, numericality: {message: 'Cost must be a number.'}

end
