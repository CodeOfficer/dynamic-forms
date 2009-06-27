class Asset < ActiveRecord::Base
  belongs_to :template
  
  serialize :data
  
end
