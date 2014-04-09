class Weight < ActiveRecord::Base

  belongs_to :keg

  def get_beer_count

    # TODO Need to validate the calibration from spreadsheet. I'm not sure I took into account the keg weight quite right.
    # It currently equals 6 pints which is deceptively low

    #zero is b from calibration linear fit minus 1/2 variance, so 291 - 3
    b = 291 - 3
    # slope is m from calibration linear fit
    m = 2.749
    lbs_h2o = 8.3453
    pint_per_gal = 8
    beer_count = ((self.raw - b)*pint_per_gal)/(m * lbs_h2o) - 6
    beer_count
  end
end
