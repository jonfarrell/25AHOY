class RegistrationsController < ApplicationController
  # before_action :set_registration, only: [:show, :edit, :update, :destroy]

  # GET /registrations
  def index
    @registrations = Registration.all
  end

  # GET /registrations/1
  def show
  end

  # GET /registrations/new
  def new
    @registration = Registration.new
    @course = Course.find_by id: params["course_id"]
  end

  # POST /registrations
  def create
    @registration = Registration.new(registration_params.merge(email: stripe_params["stripeEmail"], card_token: stripe_params["stripeToken"]))
    raise "Please, check registration errors" unless @registration.valid?
    @registration.process_payment
    @registration.save
    redirect_to @registration, notice: 'Registration was successfully created.'
  # rescue e
  #   flash[:error] = e.message
  #   render :new
  end

  private
    def stripe_params
      params.permit :stripeEmail, :stripeToken
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
      params.require(:registration).permit(:course_id, :full_name, :shirtsize, :telephone)
    end
end
