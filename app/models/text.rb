class Text < ApplicationRecord
  validates_presence_of :identifier, :content
end
