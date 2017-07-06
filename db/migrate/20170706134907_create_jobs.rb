class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :exp_required
      t.string :salary
      t.string :location
      t.string :company_name

      t.timestamps
    end
  end
end
