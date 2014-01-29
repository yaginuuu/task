class TasktopsController < ApplicationController
  before_action :set_tasktop, only: [:show, :edit, :update, :destroy]

  # GET /tasktops
  # GET /tasktops.json
  def index
    @tasktops = Tasktop.all
  end

  # GET /tasktops/1
  # GET /tasktops/1.json
  def show
  end

  # GET /tasktops/new
  def new
    @tasktop = Tasktop.new
  end

  # GET /tasktops/1/edit
  def edit
  end

  # POST /tasktops
  # POST /tasktops.json
  def create
    @tasktop = Tasktop.new(tasktop_params)

    respond_to do |format|
      if @tasktop.save
        format.html { redirect_to @tasktop, notice: 'Tasktop was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tasktop }
      else
        format.html { render action: 'new' }
        format.json { render json: @tasktop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasktops/1
  # PATCH/PUT /tasktops/1.json
  def update
    respond_to do |format|
      if @tasktop.update(tasktop_params)
        format.html { redirect_to @tasktop, notice: 'Tasktop was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tasktop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasktops/1
  # DELETE /tasktops/1.json
  def destroy
    @tasktop.destroy
    respond_to do |format|
      format.html { redirect_to tasktops_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tasktop
      @tasktop = Tasktop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tasktop_params
      params.require(:tasktop).permit(:name, :weight, :owner)
    end
end
