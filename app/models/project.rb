class Project < ApplicationRecord
  validates_presence_of :title, :description

  has_one_attached :image, dependent: :destroy
end
