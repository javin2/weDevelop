class Conversation < ApplicationRecord
  belongs_to :project
  has_many :messages

  accepts_nested_attributes_for :messages
end
