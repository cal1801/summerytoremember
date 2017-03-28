class AddCampToAddress < ActiveRecord::Migration
  def change
    add_reference :addresses, :camp, index: true, foreign_key: true
  end
end
