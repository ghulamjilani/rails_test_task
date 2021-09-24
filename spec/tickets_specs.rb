require 'rails_helper'
require 'json'

RSpec.describe 'TicketsController', type: :request do
  it "create a ticket" do
    count = Ticket.count
    post "/api/tickets", params: JSON.parse(open('spec/ticket_params.json').read)
    new_count =  Ticket.count
    expect(new_count).to eq(count + 1)
  end
end