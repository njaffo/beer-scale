class HomeController < ApplicationController

  before_action :load_weight_data_feed_info

  def index
    # @weights = Weight.all
    # @weights = Weight.where("created_at > '2014-04-09'")
    @weights = Weight.where("keg_id = ?", @weight_data_info.keg_id).order(:created_at)
    @keg = Keg.find(@weight_data_info.keg_id)
    if(!@keg.end_date)
      @events_by_keg = Event.where("day > ?", @keg.start_date)
    else
      @events_by_keg = Event.where("day > ? AND day < ?", @keg.start_date, @keg.end_date)
    end
    logger.info("  ----  events_by_keg: "+ @events_by_keg.to_s)
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
