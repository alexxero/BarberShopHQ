class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contact do |t|
      t.text :name
      t.text :email
      t.text :message

      
    end
  end
end
