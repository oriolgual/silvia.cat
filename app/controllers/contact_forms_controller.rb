class ContactFormsController < ApplicationController
  def new
    @contact_form = ContactForm.new
  end

  def create
    @contact_form = ContactForm.new(params[:contact_form])
    @contact_form.request = request
    if @contact_form.deliver
      flash.now[:notice] = 'Thank you for contacting me! You will be receiving an answer soon'
    end
    render action: 'new'
  end
end
