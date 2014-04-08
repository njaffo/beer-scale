class WeightDataFeedInfosController < ApplicationController
  def new
  end

  private
  def app_params
    params.require(:weight_data_feed_info).permit(:last_received_raw, :last_received_created_at, :last_stored_raw, :last_stored_created_at)
  end
end
