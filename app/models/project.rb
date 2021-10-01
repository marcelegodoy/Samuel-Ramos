class Project < ApplicationRecord
  validates_presence_of :title, :description

  has_many_attached :images, dependent: :destroy
end
