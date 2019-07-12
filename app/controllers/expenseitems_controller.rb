class ExpenseitemsController < ApplicationController

    def create
        @expenseitem = ExpenseItem.create(expenseitem_params)
        render json: @expenseitem
    end

    def index
        @expenseitems = ExpenseItem.all
        render json: @expenseitems
    end

    def update
        @expenseitem = ExpenseItem.find_by(id: params[:id])
            if @expenseitem 
                @expenseitem.update(paid: params[:paid])
                render json: @expenseitem
            end
    end

    def destroy
        @expenseitem = ExpenseItem.find_by(id: params[:id])
        @expenseitem.destroy

        render json: @expenseitem
    end

    private

    def expenseitem_params
        params.permit(:trip_id, :name, :estimated_cost, :id, :paid)
    end
end