class ExpenseitemsController < ApplicationController

    def create
        @expenseitem = ExpenseItem.create(expenseitem_params)
        if params[:estimated_cost].to_i >= 0 
            if @expenseitem && @expenseitem.valid?
                render json: @expenseitem
            else
                errorsArr = []
                @expenseitem.errors.messages.each do |key, value|
                    value.each do |string|
                        errorsArr.push(string)
                    end
                end
                render json: {error: errorsArr}
            end
        else
            @expenseitem.destroy
            render json: {error: ['Cost cannot be less than zero.']} 
        end
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