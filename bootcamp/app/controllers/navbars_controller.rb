class NavbarsController < ApplicationController
  before_action :set_navbar, only: %i[ show edit update destroy ]

  # GET /navbars or /navbars.json
  def index
    @navbars = Navbar.all
  end

  # GET /navbars/1 or /navbars/1.json
  def show
  end

  # GET /navbars/new
  def new
    @navbar = Navbar.new
  end

  # GET /navbars/1/edit
  def edit
  end

  # POST /navbars or /navbars.json
  def create
    @navbar = Navbar.new(navbar_params)

    respond_to do |format|
      if @navbar.save
        format.html { redirect_to navbar_url(@navbar), notice: "Navbar was successfully created." }
        format.json { render :show, status: :created, location: @navbar }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @navbar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /navbars/1 or /navbars/1.json
  def update
    respond_to do |format|
      if @navbar.update(navbar_params)
        format.html { redirect_to navbar_url(@navbar), notice: "Navbar was successfully updated." }
        format.json { render :show, status: :ok, location: @navbar }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @navbar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /navbars/1 or /navbars/1.json
  def destroy
    @navbar.destroy

    respond_to do |format|
      format.html { redirect_to navbars_url, notice: "Navbar was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_navbar
      @navbar = Navbar.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def navbar_params
      params.require(:navbar).permit(:label, :url)
    end
end
