class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :description
      t.string :status
      t.string :employment_type
      t.string :position
      t.string :field
      t.text :skills
      t.string :education_level
      t.timestamps
    end
  end
end
