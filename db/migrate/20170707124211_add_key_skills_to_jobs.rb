class AddKeySkillsToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :key_skills, :text
  end
end
