class ShowtimesController < ApplicationController
  before_action :set_showtime, only: %i[ show edit update destroy ]

  # GET /showtimes or /showtimes.json
  def index
    @showtimes = Showtime.all.sort_by(&:start_time)
  end

  # GET /showtimes/1 or /showtimes/1.json
  def show
  end

  # GET /showtimes/new
  def new
    get_options
    @showtime = Showtime.new
  end

  def get_options
    @movie_options = Movie.all.map{ |movie| [movie.title, movie.id] }
    @auditorium_options = Auditorium.all.map{ |auditorium| [auditorium.name, auditorium.id] }
  end

  # GET /showtimes/1/edit
  def edit
    get_options
  end

  # POST /showtimes or /showtimes.json
  def create
    @get_options
    @showtime = Showtime.new(showtime_params)

    respond_to do |format|
      if @showtime.save
        format.html { redirect_to @showtime, notice: "Showtime was successfully created." }
        format.json { render :show, status: :created, location: @showtime }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @showtime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /showtimes/1 or /showtimes/1.json
  def update
    respond_to do |format|
      if @showtime.update(showtime_params)
        format.html { redirect_to @showtime, notice: "Showtime was successfully updated." }
        format.json { render :show, status: :ok, location: @showtime }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @showtime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /showtimes/1 or /showtimes/1.json
  def destroy
    @showtime.destroy
    respond_to do |format|
      format.html { redirect_to showtimes_url, notice: "Showtime was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_showtime
      @showtime = Showtime.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def showtime_params
      params.require(:showtime).permit(:start_time, :end_time, :seats_purchased, :movie_id, :auditorium_id)
    end
end
