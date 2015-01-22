class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :rating
      t.text :description
      t.string :customer
      t.string :performer
      t.integer :project_id
      t.string :state

      t.timestamps null: false
    end
  end
end
