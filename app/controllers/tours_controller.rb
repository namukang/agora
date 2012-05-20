class ToursController < ApplicationController
  # GET /tours
  # GET /tours.json
  def index
    @tours = Tour.all

    respond_to do |format|
      if params[:table]
        format.html  { render 'table' }
      else
        format.html # index.html.erb
      end
      format.json { render json: @tours }
    end
  end

  # GET /tours/1
  # GET /tours/1.json
  def show
    @tour = Tour.find(params[:id])
    if @tour.title == "Food Cart"
      @guide = "Neal Donnelly"
      @guide_image = "neal.png"
      @guide_bio = "I'm a Princeton University student hailing from Northampton, MA (in western mass, not near Boston). I'm studying electrical engineering, I've worked three summers as a web developer, and I've dabbled in design, flash game development, and painting. I'm also an expert in New York's food carts, because I absolutely love food."
    else
      @guide = "Dan Kang"
      @guide_image = "dk.png"
      @guide_bio = "I am an ex-convict who knows my share of New York. I've dabbled in graffi and have many friends who are well-recognized in the New York graffiti scene."
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tour }
    end
  end

  # GET /tours/new
  # GET /tours/new.json
  def new
    @tour = Tour.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tour }
    end
  end

  # GET /tours/1/edit
  def edit
    @tour = Tour.find(params[:id])
  end

  # POST /tours
  # POST /tours.json
  def create
    @tour = Tour.new(params[:tour])

    respond_to do |format|
      if @tour.save
        format.html { redirect_to @tour, notice: 'Tour was successfully created.' }
        format.json { render json: @tour, status: :created, location: @tour }
      else
        format.html { render action: "new" }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tours/1
  # PUT /tours/1.json
  def update
    @tour = Tour.find(params[:id])

    respond_to do |format|
      if @tour.update_attributes(params[:tour])
        format.html { redirect_to @tour, notice: 'Tour was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tours/1
  # DELETE /tours/1.json
  def destroy
    @tour = Tour.find(params[:id])
    @tour.destroy

    respond_to do |format|
      format.html { redirect_to tours_url }
      format.json { head :no_content }
    end
  end
end
