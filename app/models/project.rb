class Project < ApplicationRecord
  belongs_to :developer
  has_many :project_members
  has_many :clients, :through => :project_members
  has_many :notes

  accepts_nested_attributes_for :notes
  
end
