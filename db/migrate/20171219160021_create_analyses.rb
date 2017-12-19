class CreateAnalyses < ActiveRecord::Migration[5.1]
  def change
    create_table :analyses do |t|
      t.string :type
      t.string :url
      t.text :result

      t.timestamps
    end
  end
end
