class RemoveColumn < ActiveRecord::Migration
  def change
    remove_column :courses, :suppervisor_id
  end
end
