require 'rails_helper'

RSpec.describe Place, type: :model do
  # ensure an place record belongs to a single stroll record
  it { should belong_to(:stroll) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:name) }
end
