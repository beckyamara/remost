class UserStepsController < ApplicationController
  include Wicked::Wizard
  steps :company

  def show
    render_wizard
  end

private

  def redirect_to_finish_wizard
    redirect_to cities_path, notice: "Thank you for signing up. Now you can meet your colleagues all around the world!"
  end
end
