class WeightsController < ApplicationController

  before_action :load_weight_data_feed_info
  before_action :set_weight, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }

  # GET /weights
  # GET /weights.json
  def index
    # @weights = Weight.all
    # @weights = Weight.where("created_at > '2014-04-09'")
    @weights = Weight.where("keg_id = ?", @weight_data_info.keg_id).order(:created_at)
    @weights_last = Weight.last(50).order(created_at: :desc)
    @keg = Keg.find(@weight_data_info.keg_id)
  end

  # GET /weights/1
  # GET /weights/1.json
  def show
  end

  # GET /weights/new
  def new
    @weight = Weight.new
  end

  # GET /weights/1/edit
  def edit
  end

  # POST /weights
  # POST /weights.json
  def create
    p params
    p request.raw_post
    @weight = Weight.new(weight_params)
    @weight.keg_id = @weight_data_info.keg_id

    respond_to do |format|
      #if @weight.save
      #  format.html { redirect_to @weight, notice: 'Weight was successfully created.' }
      #  format.json { render action: 'show', status: :created, location: @weight }
      #else
      #  format.html { render action: 'new' }
      #  format.json { render json: @weight.errors, status: :unprocessable_entity }
      #end

      # save weight if new is lower than last stored or if new is greater than 2x perceived amplitude of about 6
      if @weight.raw < @weight_data_info.last_stored_raw or (@weight.raw - @weight_data_info.last_stored_raw) > 12
        # perform weight.save and update last stored and last received
        if @weight.save
          @weight_data_info.last_stored_raw = @weight.raw
          @weight_data_info.last_stored_created_at = @weight.created_at
          @weight_data_info.last_received_raw = @weight.raw
          @weight_data_info.last_received_created_at = @weight.created_at
          @weight_data_info.save
          format.html { redirect_to @weight, notice: 'Weight was successfully created.' }
          format.json { render action: 'show', status: :created, location: @weight }
        else
          format.html { render action: 'new' }
          format.json { render json: @weight.errors, status: :unprocessable_entity }
        end
      else
        # update last received, need to fake created_at field
        @weight_data_info.last_received_raw = @weight.raw
        @weight_data_info.last_received_created_at = Time.now
        @weight_data_info.save
        format.html { redirect_to @weight, notice: 'Weight was skipped.' }
        format.json { render action: 'show', status: :created, location: @weight }
      end
    end
  end

  # PATCH/PUT /weights/1
  # PATCH/PUT /weights/1.json
  def update
    respond_to do |format|
      if @weight.update(weight_params)
        format.html { redirect_to @weight, notice: 'Weight was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @weight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weights/1
  # DELETE /weights/1.json
  def destroy
    @weight.destroy
    respond_to do |format|
      format.html { redirect_to weights_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weight
      @weight = Weight.find(params[:id])
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def weight_params
      params.require(:weight).permit(:raw, :keg_id)
    end

end
