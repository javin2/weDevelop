class Project < ApplicationRecord
  
  belongs_to :developer
  has_many :project_members
  has_many :clients, :through => :project_members
  has_many :notes
end
