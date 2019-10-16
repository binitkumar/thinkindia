class Api::ContactsController < ApplicationController

  def update
    contact = Contact.new(contact_params)

    if contact.save
      render json: { 
        status: 'success',
        message: 'Contact created successfully'
      }
    else
      render json: { 
        status: 'failure',
        message: contact.errors.full_messages
      }
    end
  end

  def contact_params
    params.permit(:name, :email, :message)
  end
end
