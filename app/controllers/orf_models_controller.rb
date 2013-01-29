class OrfModelsController < ApplicationController
  # GET /orf_models
  # GET /orf_models.json
  def index
    if params[:q].blank?
      @orf_models = OrfModel.paginate(page: params[:page], per_page: 25)
    else
      @orf_models = OrfModel.paginate(page: params[:page], per_page: 25,
                                      conditions: ["name = ?", params[:q]])
    end
      
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orf_models }
    end
  end

  # GET /orf_models/1
  # GET /orf_models/1.json
  def show
    @orf_model = OrfModel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @orf_model }
    end
  end

  # GET /orf_models/new
  # GET /orf_models/new.json
  def new
    @orf_model = OrfModel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @orf_model }
    end
  end

  # GET /orf_models/1/edit
  def edit
    @orf_model = OrfModel.find(params[:id])
  end

  # POST /orf_models
  # POST /orf_models.json
  def create
    @orf_model = OrfModel.new(params[:orf_model])

    respond_to do |format|
      if @orf_model.save
        format.html { redirect_to @orf_model, notice: 'Orf model was successfully created.' }
        format.json { render json: @orf_model, status: :created, location: @orf_model }
      else
        format.html { render action: "new" }
        format.json { render json: @orf_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orf_models/1
  # PUT /orf_models/1.json
  def update
    @orf_model = OrfModel.find(params[:id])

    respond_to do |format|
      if @orf_model.update_attributes(params[:orf_model])
        format.html { redirect_to @orf_model, notice: 'Orf model was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @orf_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orf_models/1
  # DELETE /orf_models/1.json
  def destroy
    @orf_model = OrfModel.find(params[:id])
    @orf_model.destroy

    respond_to do |format|
      format.html { redirect_to orf_models_url }
      format.json { head :no_content }
    end
  end


  def fasta_cds
    @orf_model = OrfModel.find(params[:id])
    @fasta = ">#{@orf_model.description}\n"
    @fasta << @orf_model.naseq.gsub(/.{,60}/, "\\0\n")
  end

  def fasta_pep
    @orf_model = OrfModel.find(params[:id])
    @fasta = ">#{@orf_model.description}\n"
    @fasta << @orf_model.aaseq.gsub(/.{,60}/, "\\0\n")
  end

  def blast_nr
    @orf_model = OrfModel.find(params[:id])
    @blast_lines = @orf_model.blast_nr_results
  end

  def blast_termite454
    @orf_model = OrfModel.find(params[:id])
    @blast_lines = @orf_model.blast_termite454_results
  end
  
  def parent_transcript
    @orf_model = OrfModel.find(params[:id])
    @transcript = @orf_model.transcript_model
  end

end
