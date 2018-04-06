class CreateStrolls < ActiveRecord::Migration[5.1]
  def change
    create_table :strolls do |t|
      t.string :title
      t.string :created_by

      t.timestamps
    end
  end
end
