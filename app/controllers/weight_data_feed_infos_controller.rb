class WeightDataFeedInfosController < ApplicationController

  before_action :load_weight_data_feed_info, only: [:index, :edit]
  before_action :set_weight_data_feed_info, only: [:edit, :update]

  def new
  end

  def index

  end

  def edit
  end

  def update
    respond_to do |format|
      if @weight_data_feed_info.update(keg_params)
        format.html { redirect_to @weight_data_feed_info, notice: 'Weight Datafeed Info was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @weight_data_feed_info.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_weight_data_feed_info
    @weight_data_feed_info = WeightDataFeedInfo.first
  end

  def weight_data_feed_info_params
    params.require(:weight_data_feed_info).permit(:last_received_raw, :last_received_created_at, :last_stored_raw, :last_stored_created_at, :keg_id)
  end

  def load_weight_data_feed_info
    @weight_data_info = WeightDataFeedInfo.first
    if @weight_data_info.nil?
      weight_last = Weight.last
      @weight_data_info = WeightDataFeedInfo.new
      @weight_data_info.last_stored_raw = weight_last.raw
      @weight_data_info.last_stored_created_at = weight_last.created_at
      @weight_data_info.last_received_raw = weight_last.raw
      @weight_data_info.last_received_created_at = weight_last.created_at
      @weight_data_info.save
    end
  end
end
