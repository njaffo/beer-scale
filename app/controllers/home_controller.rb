class HomeController < ApplicationController

  before_action :load_weight_data_feed_info

  def index
    # @weights = Weight.all
    # @weights = Weight.where("created_at > '2014-04-09'")
    @weights = Weight.where("keg_id = ?", @weight_data_info.keg_id).order(:created_at)
    @keg = Keg.find(@weight_data_info.keg_id)
  end

  private

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
