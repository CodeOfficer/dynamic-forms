#  -----------------------------------------------------------------------------
# http://api.rubyonrails.org/classes/ActiveRecord/Base.html
# http://syndeolabs.com/entries/that-old-rails-serialize-method
# http://jqr.github.com/2009/02/01/the-making-of-typed-serialize.html
# http://github.com/jqr/typed_serialize/tree/master
#  -----------------------------------------------------------------------------

class AssetTemplate < ActiveRecord::Base
  has_many :assets
  
  serialize :form_data, Array
  
  # def form_data
  #   self.form_data_will_change!
  # end
  # 
  # def form_data
  #   # self.form_data_will_change!
  #   logger.debug { "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" }
  #   logger.debug { "#{self.form_data.class.to_s}" }
  #   logger.debug { "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" }
  # end
  
  def form_data=(data)
    self.form_data_will_change!
    logger.debug { "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" }
    logger.debug { "#{data.class.to_s}" }
    logger.debug { "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" }
  end
  
end

# class ActiveRecord::Base 
#   def self.typed_serialize(attr_name, class_name)
#     serialize(attr_name, class_name)
#  
#     define_method(attr_name) do
#       expected_class = self.class.serialized_attributes[attr_name.to_s]
#       if (value = super).is_a?(expected_class) 
#         value
#       else
#         send("#{attr_name}=", expected_class.new)
#       end
#     end
#   end
# end



# def value
#   self[:value] ? Marshal.load(self[:value]) : nil
# end
# 
# def value=(x)
#   self[:value] = Marshal.dump(x)
# end

# Parameters: 
# 
# {
#     "commit"=>"Update",
#      "asset_template"=>
#     {
#         "name"=>"template name #7 (asset_template_with_all_form_data)",
#          "form_data"=>
#         {
#             "textarea_field_2"=>"",
#              "select_field_2"=>"",
#              "text_field_2"=>""
#         }
#     },
#      "authenticity_token"=>"N5BYH9SMGLQvPzhLPamoOoNL2G5e5UtKXoHO0CX9MH4=",
#      "id"=>"77"
# }
