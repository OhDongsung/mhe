class CreatePmes < ActiveRecord::Migration[5.1]
  def change
    create_table :pmes do |t|
      t.string :activity
      t.string :vector0
      t.string :vector1
      t.string :vector2
      t.string :time, unique:true
      t.boolean :subscribed, default:false
    end
  end
end
