#  -----------------------------------------------------------------------------
# http://api.rubyonrails.org/classes/ActiveRecord/Base.html
# http://syndeolabs.com/entries/that-old-rails-serialize-method
#  -----------------------------------------------------------------------------

class AssetTemplate < ActiveRecord::Base
  has_many :assets
  
  serialize :form_data, Array
  
  def form_data
    self.form_data_will_change!
  end
  
  def form_data=(data)
    self.form_data_will_change!
    
  end
  
end
