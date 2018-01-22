class AddCurrentStageToApplication < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :stage_id, :integer
  end
end
