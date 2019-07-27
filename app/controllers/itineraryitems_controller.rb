class ItineraryitemsController < ApplicationController
    
    def create
        checkedLink = httpchecker(params[:link])
        newParams = itineraryitem_params
        newParams[:link] = checkedLink

        @itineraryitem = ItineraryItem.create(newParams)
        
        if @itineraryitem && @itineraryitem.valid?
            render json: @itineraryitem
        else 
            render json: {error: ['Activity cannot be blank.']}
        end
        
    end

    def index
        @itineraryitems = ItineraryItem.all
        render json: @itineraryitems
    end

    def update
        @itineraryitem = ItineraryItem.find_by(id: params[:id])
            if @itineraryitem
                checkedLink = httpchecker(params[:link])
                @itineraryitem.update(name: params[:name], link: checkedLink)
                render json: @itineraryitem
            end
    end

    def destroy
        @itineraryitem = ItineraryItem.find_by(id: params[:id])
        @itineraryitem.destroy

        render json: @itineraryitem
    end

    private

    def itineraryitem_params
        params.permit(:trip_id, :name, :id, :link)
    end

    def httpchecker(linkString)
        lowerStr = linkString.downcase
        
        if lowerStr.include?('http://') || lowerStr.include?('https://')
            return lowerStr
        elsif linkString.length === 0
            return linkString
        else
            return 'http://' + lowerStr
        end 
    
    end

end