class CreateCandidates < ActiveRecord::Migration[5.1]
  def change
    create_table :candidates do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :email
      t.integer :phone
      t.text :education
      t.text :link_to_resume
      t.text :work_experience
      t.timestamps
    end
  end
end
