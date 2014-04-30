class Weight < ActiveRecord::Base

  belongs_to :keg

  def get_beer_count

    # TODO Need to validate the calibration from spreadsheet. I'm not sure I took into account the keg weight quite right.
    # It currently equals 6 pints which is deceptively low

    keg_gal = self.keg.volume
    weight_raw_full = self.keg.start_raw
    # zero is b from calibration linear fit minus 1/2 variance, so b = 291 - 3. Note, zero factors out of equation since calculating backwards from full weight
    # slope is m from calibration linear fit
    m = 2.749
    lbs_h2o = 8.3453
    pint_per_gal = 8
    #old calc --> beer_count = ((self.raw - b)*pint_per_gal)/(m * lbs_h2o) - 6

    pints_full = keg_gal * pint_per_gal
    # don't want calc, want measured, because it includes the keg weight
    # old calc --> weight_raw_full = m * keg_gal * lbs_h2o + b
    pints_consumed = ((weight_raw_full - self.raw) * pint_per_gal) / (m * lbs_h2o)
    beer_count = pints_full - pints_consumed
  end
end
