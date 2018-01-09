class CreateCandidates < ActiveRecord::Migration[5.1]
  def change
    create_table :candidates do |t|
      t.text :name
      t.text :link_to_resume
      t.timestamps
    end
  end
end
