# @template.logger.debug { @template.content_tag(:span, "xxx") }

class TemplateFormBuilder < ActionView::Helpers::FormBuilder
  
  def render_form_data
    "testing"
  end
  
  def debug_form_data
    self.object.form_data.to_yaml
  end
  
#   %w[text_field file_field collection_select select password_field text_area time_zone_select state_select].each do |method_name|
#     define_method(method_name) do |field_name, *args|
#       @template.content_tag(:p, field_label(field_name, *args) + " " + field_error(field_name) + field_break(field_name, *args) + field_note(field_name, *args) + super)
#     end
#   end
#   
#   def check_box(field_name, *args)
#     @template.content_tag(:p, super + " " + field_label(field_name, *args) + " " + field_error(field_name))
#   end
#   
#   def submit(*args)
#     @template.content_tag(:span, super)
#   end
#   
#   def select_category(field_name, params, *args)
#     categories = eval("Category.#{object_name.pluralize.downcase}").collect {|cat| [cat.name, cat.id.to_s]}
#     if params[object_name.to_sym] && params[object_name.to_sym][:category_attributes]
#       selected = params[object_name.to_sym][:category_attributes]
#     else
#       selected = object.categories.collect { |cat| cat.id.to_s }
#     end
#     selector = "<select id='#{field_name}' name='#{object_name}[category_attributes][]'>" + "<option value=''/>" + @template.options_for_select(categories, selected) + "</select>" 
#     @template.content_tag(:p, field_label(field_name, *args) + " " + field_error(field_name) + field_break(field_name, *args) + field_note(field_name, *args) + selector)
#   end
#   
#   def wymeditor_text_area(field_name, *args)
#     @template.send :include_assets_for_wymeditor
#     @template.send :javascript_wymeditor_initialization
#     self.text_area(field_name, {:class=> "wymeditor"} )
#   end
#   
#   def fckeditor_text_area(field_name, *args)
#     @template.send :include_assets_for_fckeditor
#     @template.send :content_for, :more_jquery_code do <<-EOS
#       //<![CDATA[
#       var oFCKeditor = new FCKeditor('#{object_name}_#{field_name}', '700px', '250px', 'Basic');
#       oFCKeditor.BasePath = "/javascripts/fckeditor/"
#       oFCKeditor.Config['CustomConfigurationsPath'] = '/javascripts/fckcustom.js';
#       oFCKeditor.ReplaceTextarea();
#       //]]>
#       EOS
#     end
#     self.text_area(field_name, {:class=> "fckeditor"} )
#   end
#   
#   # will this work?
#   def fields_for(*args, &block)
#     options = args.extract_options!.merge(:builder => LabeledFormBuilder)
#     super(*(args + [options]), &block)
#   end
#   
#   def select_affiliate(field_name, current_user, params, *args)
#     if object.new_record?
#       if affiliates = current_user.affiliates.with_combined_statuses('approved').collect {|p| [ p.name, p.id.to_s ] }
#         unless affiliates.blank?
#           if params[object_name.to_sym] && params[object_name.to_sym][:affiliate_id]
#             selected = params[object_name.to_sym][:affiliate_id]
#           else
#             selected = object.affiliate_id.to_s
#           end
#           self.select(field_name, affiliates, {:include_blank => 'None', :selected => selected })
#         end
#       end
#     else 
#       if object.owned_by_affiliate?
#         @template.content_tag(:p, field_label(field_name, *args) + "<br/> " + field_note(field_name, *args) + ERB::Util.html_escape(object.owner_name))        
#       end
#     end
#   end
# 
#   def submit_button(*args)
#     @template.submit_button(*args)
#   end
#   
#   def label_nothing(field_name, *args, &block)
#     @template.concat(@template.content_tag(:p, field_label(field_name, *args) + " " + field_error(field_name) + field_break(field_name, *args) + @template.capture(&block)))
#   end
#   
#   # def many_check_boxes(name, subobjects, id_method, name_method, options = {})
#   #   @template.content_tag(:p) do
#   #     field_name = "#{object_name}[#{name}][]"
#   #     subobjects.map do |subobject|
#   #       @template.check_box_tag(field_name, subobject.send(id_method), object.send(name).include?(subobject.send(id_method))) + " " + subobject.send(name_method)
#   #     end.join("<br />") + @template.hidden_field_tag(field_name, "")
#   #   end
#   # end
#   
#   def custom_error_messages(*args)
#     @template.render_custom_error_messages(object, *args)
#   end
#   
#   def ajax_spinner(dom_id)
#     @template.content_tag(:span, @template.spinner_image, :class => 'ajax_spinner', :id => dom_id)
#   end
#   
# private #  ---------------------------------------------------------------------
#   
#   def field_error(field_name)
#     if object.errors.invalid? field_name
#       @template.content_tag(:span, [object.errors.on(field_name)].flatten.first.sub(/^\^/, ''), :class => 'error_message')
#     else
#       ''
#     end
#   end
#   
#   def field_note(field_name, *args)
#     options = args.extract_options!
#     if options[:note]
#       @template.content_tag(:span, options[:note], :class => "note") + "<br/>"
#     else
#       ''
#     end
#   end
#   
#   def field_break(field_name, *args)
#     options = args.extract_options!
#     if options[:no_label] || options[:no_br]
#       '' 
#     else 
#       '<br />'
#     end
#   end
#   
#   def field_label(field_name, *args)
#     options = args.extract_options!
#     options[:label_class] = "required" if options[:required]
#     if options[:no_label].eql?(true) 
#       ''
#     else
#       label(field_name, options[:label], :class => options[:label_class])
#     end
#   end
#   
#   def objectify_options(options)
#     super.except(:label, :required, :label_class, :no_label, :no_br, :note)
#   end
end