class AddRequestIpToAnalysis < ActiveRecord::Migration[5.1]
  def change
    add_column :analyses, :request_ip, :string
  end
end
