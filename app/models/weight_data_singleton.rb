require 'singleton'

class WeightDataSingleton
  include Singleton

  class << self; attr_accessor :last_weight_stored, :last_weight_received end

  @last_weight_stored = nil
  @last_weight_received = nil
end

