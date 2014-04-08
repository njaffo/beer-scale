class WeightsController < ApplicationController

  before_action :set_weight, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }

  # GET /weights
  # GET /weights.json
  def index
    @weights = Weight.all
    @weights_last = Weight.last(100)
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
    @weight_data_info = WeightDataInfo.first
    weight_last = Weight.last

    logger.info " === Proof that logging.info from app is working"
    puts(" === Proof that puts from app is working")

    respond_to do |format|

      if @weight_data_info.nil?
        puts("     === WeightDataInfo.first is nil")
        puts(" === Attempting to set data in WeightDataSingleton")
        @weight_data_info.last_stored_raw = weight_last.raw
        @weight_data_info.last_stored_created_at = weight_last.created_at
        @weight_data_info.last_received_raw = weight_last.raw
        @weight_data_info.last_received_created_at = weight_last.created_at
        @weight_data_info.save
      end
      puts(@weight_data_info);

      if @weight.save
        format.html { redirect_to @weight, notice: 'Weight was successfully created.' }
        format.json { render action: 'show', status: :created, location: @weight }
      else
        format.html { render action: 'new' }
        format.json { render json: @weight.errors, status: :unprocessable_entity }
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def weight_params
      params.require(:weight).permit(:raw)
    end

end
