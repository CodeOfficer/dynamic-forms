class Asset < ActiveRecord::Base
  belongs_to :asset_template
  
  serialize :data
  
end
