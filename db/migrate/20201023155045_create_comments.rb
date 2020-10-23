class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.column(:author, :string)
      t.column(:comment_body, :string)
    end
  end
end
