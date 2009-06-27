class AssetTemplate < ActiveRecord::Base
  has_many :assets
  
  serialize :form_data
end
