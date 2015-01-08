class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.references :course, index: true
      t.references :user, index: true
      t.boolean :status_course

      t.timestamps
    end
  end
end
