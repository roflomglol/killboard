class KillmailsController < ApplicationController
  before_action :set_killmail, only: [:show, :edit, :update, :destroy]

  # GET /killmails
  def index
    @killmails = Killmail.all
  end

  # GET /killmails/1
  def show
  end

  # GET /killmails/new
  def new
    @killmail = Killmail.new
  end

  # GET /killmails/1/edit
  def edit
  end

  # POST /killmails
  def create
    @killmail = Killmail.new(killmail_params)

    if @killmail.save
      redirect_to @killmail, notice: 'Killmail was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /killmails/1
  def update
    if @killmail.update(killmail_params)
      redirect_to @killmail, notice: 'Killmail was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /killmails/1
  def destroy
    @killmail.destroy
    redirect_to killmails_url, notice: 'Killmail was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_killmail
      @killmail = Killmail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def killmail_params
      params.require(:killmail).permit(:body)
    end
end
