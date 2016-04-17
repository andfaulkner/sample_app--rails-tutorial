class BearsController < ApplicationController
  # GET /bears
  # GET /bears.json
  def index
    @bears = Bear.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bears }
    end
  end

  # GET /bears/1
  # GET /bears/1.json
  def show
    @bear = Bear.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bear }
    end
  end

  # GET /bears/new
  # GET /bears/new.json
  def new
    @bear = Bear.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bear }
    end
  end

  # GET /bears/1/edit
  def edit
    @bear = Bear.find(params[:id])
  end

  # POST /bears
  # POST /bears.json
  def create
    @bear = Bear.new(params[:bear])

    respond_to do |format|
      if @bear.save
        format.html { redirect_to @bear, notice: 'Bear was successfully created.' }
        format.json { render json: @bear, status: :created, location: @bear }
      else
        format.html { render action: "new" }
        format.json { render json: @bear.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bears/1
  # PUT /bears/1.json
  def update
    @bear = Bear.find(params[:id])

    respond_to do |format|
      if @bear.update_attributes(params[:bear])
        format.html { redirect_to @bear, notice: 'Bear was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bear.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bears/1
  # DELETE /bears/1.json
  def destroy
    @bear = Bear.find(params[:id])
    @bear.destroy

    respond_to do |format|
      format.html { redirect_to bears_url }
      format.json { head :no_content }
    end
  end
end
