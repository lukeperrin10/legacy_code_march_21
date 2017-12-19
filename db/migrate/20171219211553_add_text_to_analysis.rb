class AddTextToAnalysis < ActiveRecord::Migration[5.1]
  def change
    add_column :analyses, :text, :text
  end
end
