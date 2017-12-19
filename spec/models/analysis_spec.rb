require 'rails_helper'

RSpec.describe Analysis, type: :model do


  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :type }
  it { is_expected.to have_db_column :url }
  it { is_expected.to have_db_column :result }
end
