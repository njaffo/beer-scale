class BeerApiController < ApplicationController

  def beer_now
    @json_weight = Weight.last
    @weight_data_info = WeightDataFeedInfo.first
    if @weight_data_info.nil?
      @json_weight = Weight.last
      @weight_data_info = WeightDataFeedInfo.new
      @weight_data_info.last_stored_raw = @json_weight.raw
      @weight_data_info.last_stored_created_at = @json_weight.created_at
      @weight_data_info.last_received_raw = @json_weight.raw
      @weight_data_info.last_received_created_at = @json_weight.created_at
      @weight_data_info.save
    end
    @json_keg = Keg.find(@weight_data_info.keg_id)

    respond_to do |format|
      format.json { render json: 'beer_now' }  # , status: :created, location: @weight
      format.html { head :no_content }
    end
  end
end
