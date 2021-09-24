class Api::TicketsController < Api::ApiController

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      render json: {ticker: @ticket, excavator: @ticket.excavator}
    else
      render json: {error: 'Unable to create ticket'}
    end
  end

  private

  def ticket_params
    date_times = params.fetch(:DateTimes, {}).keys
    excavator = params[:excavator_attributes]
    contact = excavator.fetch(:Contact, {}).keys
    field_contact = excavator.fetch(:FieldContact, {}).keys
    params.permit(:ContactCenter, :RequestNumber,:SequenceNumber, :RequestType, :RequestAction, :AdditionalServiceArea, :DigsiteInfo,
                  excavator_attributes: [:CompanyName, :Address, :State, :Zip,
                                         :Type, :CrewOnsite, Contact: contact, FieldContact: field_contact],
                  DateTimes: date_times )
  end
end
