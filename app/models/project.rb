class Project < ApplicationRecord
  belongs_to :client
  belongs_to :developer
end
