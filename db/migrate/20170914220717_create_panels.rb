class CreatePanels < ActiveRecord::Migration[5.1]
  def change
    create_table :panels do |t|
      t.string :name

      t.timestamps
    end
  end
end
