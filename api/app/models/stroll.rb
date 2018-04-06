class Stroll < ApplicationRecord
    # model association
    has_many :places, dependent: :destroy

    # validations
    validates_presence_of :title, :created_by
end
