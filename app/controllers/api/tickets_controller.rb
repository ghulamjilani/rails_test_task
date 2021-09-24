class Api::TicketsController < Api::ApiController

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      @exacavator = @ticket.excavators.build(excavator_params)
      if @exacavator.save
        render json: {ticker: @ticket, exacavator: @exacavator}, status: :ok
      else
        render json: {error: 'Unable to save excavator'}, status: :unprocessable_entity
      end
    else
      render json: {error: 'Unable to save ticket'}, status: :unprocessable_entity
    end
  end

  private

  def ticket_params
    date_times = params.fetch(:DateTimes, {}).keys
    params.permit(:ContactCenter, :RequestNumber,:SequenceNumber, :RequestType, :RequestAction, :WellKnownText,
                  :AdditionalServiceArea, :DigsiteInfo, DateTimes: date_times)
  end
  def excavator_params
    excavator = params[:excavator]
    contact = excavator.fetch(:Contact, {}).keys
    field_contact = excavator.fetch(:FieldContact, {}).keys
    excavator.permit(:CompanyName, :Address, :State, :Zip, :Type, :CrewOnsite, Contact: contact, FileContact: field_contact)
  end
end
