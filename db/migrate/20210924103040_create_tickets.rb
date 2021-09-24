class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :ContactCenter
      t.string :RequestNumber
      t.string :SequenceNumber
      t.string :RequestType
      t.string :RequestAction
      t.string :WellKnownText
      t.jsonb :DateTimes
      t.jsonb :ServiceArea
      t.jsonb :AdditionalServiceArea
      t.jsonb :DigsiteInfo

      t.timestamps
    end
  end
end
