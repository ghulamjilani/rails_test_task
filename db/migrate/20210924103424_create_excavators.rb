class CreateExcavators < ActiveRecord::Migration[6.1]
  def change
    create_table :excavators do |t|
      t.string :CompanyName
      t.string :Address
      t.string :State
      t.string :Zip
      t.string :Type
      t.jsonb :Contact
      t.jsonb :FieldContact
      t.boolean :CrewOnsite
      t.references :ticket

      t.timestamps
    end
  end
end
