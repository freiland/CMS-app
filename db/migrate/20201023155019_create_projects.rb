class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.column(:name, :string)
      t.column(:author, :string)
    end
  end
end
