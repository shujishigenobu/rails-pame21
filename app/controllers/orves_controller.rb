class OrvesController < ApplicationController
  # GET /orves
  # GET /orves.json
  def index
    @orves = Orf.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orves }
    end
  end

  # GET /orves/1
  # GET /orves/1.json
  def show
    @orf = Orf.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @orf }
    end
  end

  # GET /orves/new
  # GET /orves/new.json
  def new
    @orf = Orf.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @orf }
    end
  end

  # GET /orves/1/edit
  def edit
    @orf = Orf.find(params[:id])
  end

  # POST /orves
  # POST /orves.json
  def create
    @orf = Orf.new(params[:orf])

    respond_to do |format|
      if @orf.save
        format.html { redirect_to @orf, notice: 'Orf was successfully created.' }
        format.json { render json: @orf, status: :created, location: @orf }
      else
        format.html { render action: "new" }
        format.json { render json: @orf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orves/1
  # PUT /orves/1.json
  def update
    @orf = Orf.find(params[:id])

    respond_to do |format|
      if @orf.update_attributes(params[:orf])
        format.html { redirect_to @orf, notice: 'Orf was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @orf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orves/1
  # DELETE /orves/1.json
  def destroy
    @orf = Orf.find(params[:id])
    @orf.destroy

    respond_to do |format|
      format.html { redirect_to orves_url }
      format.json { head :no_content }
    end
  end
end
