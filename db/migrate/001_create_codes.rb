class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :name
      t.string :gitlab_link
      t.text :description
    end
  end
end
