class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contact do |t|
      t.text :name
      t.text :email
      t.text :message

      t.time
    end
  end
end
