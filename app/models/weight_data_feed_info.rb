class WeightDataFeedInfo < ActiveRecord::Base
  attr_accessible :last_received_raw, :last_received_created_at, :last_stored_raw, :last_stored_created_at
end
