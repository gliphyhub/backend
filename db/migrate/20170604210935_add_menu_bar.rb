class AddMenuBar < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :menu, :boolean, default:true
  end
end
