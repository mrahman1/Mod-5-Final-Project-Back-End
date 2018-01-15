class CreateCandidates < ActiveRecord::Migration[5.1]
  def change
    create_table :candidates do |t|
      t.references :user, foreign_key: true
      t.text :name
      t.text :link_to_resume
      t.timestamps
    end
  end
end
