require 'rails_helper'

RSpec.describe Stroll, type: :model do
  # Association test
  # ensure Stroll model has a 1:m relationship with the Place model
  it { should have_many(:places).dependent(:destroy) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:created_by) }
end
