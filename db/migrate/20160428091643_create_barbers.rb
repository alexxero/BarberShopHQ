class CreateBarbers < ActiveRecord::Migration
  def change
    create_table :barbers do |t|
      t.text :name

      t.timestamps
    end

    Barber.create :name => "Jessie"
    Barber.create :name => "Walter"
    Barber.create :name => "Gus"
  end
end
