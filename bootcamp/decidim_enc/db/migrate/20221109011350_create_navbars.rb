class CreateNavbars < ActiveRecord::Migration[6.1]
  def change
    create_table :navbars do |t|
      t.string :label
      t.string :url

      t.timestamps
    end
  end
end
