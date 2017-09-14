class CreateAntibodies < ActiveRecord::Migration[5.1]
  def change
    create_table :antibodies do |t|
      t.string :name
      t.decimal :amount
      t.references :panel, foreign_key: true

      t.timestamps
    end
  end
end
