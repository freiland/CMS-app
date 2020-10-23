class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.column(:subject, :string)
      t.column(:content_body, :string)
    end
  end
end
