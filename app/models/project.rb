class Project < ApplicationRecord
  
  has_many :project_members
  has_many :notes
end
