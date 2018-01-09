class CreateJobStages < ActiveRecord::Migration[5.1]
  def change
    create_table :job_stages do |t|
      t.references :job, foreign_key: true
      t.references :stage, foreign_key: true
      t.timestamps
    end
  end
end
