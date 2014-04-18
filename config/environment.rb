# Load the Rails application.
require File.expand_path('../application', __FILE__)

BEERTIME_FORMAT = "%B %-d, %l:%M%P"
Time::DATE_FORMATS[:beer] = BEERTIME_FORMAT

# Initialize the Rails application.
BeerScale::Application.initialize!
