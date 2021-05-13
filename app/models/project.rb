class Project < ApplicationRecord
  belongs_to :developer
  has_many :project_members
  has_many :clients, :through => :project_members
  has_many :notes
  has_one :conversation

  accepts_nested_attributes_for :notes
  accepts_nested_attributes_for :conversation
  
end
