# @template.logger.debug { @template.content_tag(:span, "xxx") }

class TemplateFormBuilder < ActionView::Helpers::FormBuilder

  def render_form_data
    return unless object.attributes.include?("form_data")

    result = ""

    object.form_data.each do |data|
      result << self.send("form_data_for_#{data[:type]}", data)
    end
    result
  end

  def debug_form_data
    object.form_data.to_yaml
  end

  private

  def form_data_for_text(data)
    @template.content_tag :p do
      result = ""
      result << "#{form_data_label(data)}<br/>\n" unless data[:label].blank?
      result << "<input type='text' name='#{form_data_name(data[:name])}' value='#{form_data_value(data)}' id='#{form_data_id(data[:name])}'/>\n"
      result
    end
  end

  def form_data_for_textarea(data)
    @template.content_tag :p do
      result = ""
      result << "#{form_data_label(data)}<br/>\n" unless data[:label].blank?
      result << "<textarea name='#{form_data_name(data[:name])}' id='#{form_data_id(data[:name])}' rows='8' cols='40'>#{form_data_value(data)}</textarea>\n"
      result
    end
  end

  def form_data_for_select(data)
    @template.content_tag :p do
      result = ""
      result << "#{form_data_label(data)}<br/>\n" unless data[:label].blank?
      result << "<select name='#{form_data_name(data[:name])}' id='#{form_data_id(data[:name])}' size='1'>\n"
      result << "<option value=''></option>\n"
      result << form_data_select_options(data)
      result << "</select>\n"
      result
    end
  end

  def form_data_for_checkbox(data)
    @template.content_tag :p do
      result = ""
      result << "#{form_data_label(data)}<br/>\n" unless data[:label].blank?
      result << form_data_checkboxes(data)
      result
    end
  end

  def form_data_for_radio(data)
    @template.content_tag :p do
      result = ""
      result << "#{form_data_label(data)}<br/>\n" unless data[:label].blank?
      result << form_data_radios(data)
      result
    end
  end

  def form_data_radios(data)
    result = ''
    data[:options].each_with_index do |o, index|
      cname = form_data_name(data[:name].to_field_id)
      cvalue = data[:options][index].to_field_id
      clabel = data[:options][index]
      result << "<input type='radio' name='#{cname}' value='#{cvalue}'> #{clabel}<br/>\n"
    end
    result
  end

  def form_data_checkboxes(data)
    result = ''
    data[:options].each_with_index do |o, index|
      cname = form_data_name(data[:name].to_field_id)
      cvalue = data[:options][index].to_field_id
      clabel = data[:options][index]      
      result << "<input type='hidden' value='0' name='#{cname}'/>\n"
      result << "<input type='checkbox' name='#{cname}' value='#{cvalue}'> #{clabel}<br/>\n"
    end
    result
  end

  def form_data_select_options(data)
    result = ''
    data[:options].each_with_index do |o, index|
      result << "<option value='#{data[:options][index]}'>#{data[:options][index]}</option>\n"
    end
    result
  end

  def form_data_label(data)
    label("form_data_#{data[:name].underscore}", data[:label])
  end

  def form_data_name(name)
    "#{object_name}[form_data][#{name.underscore}]"
  end

  def form_data_id(name)
    "#{object_name}_form_data_#{name.underscore}"
  end

  def form_data_value(data)
    data[:value]
  end

  #   def field_label(field_name, *args)
  #     options = args.extract_options!
  #     options[:label_class] = "required" if options[:required]
  #     if options[:no_label].eql?(true)
  #       ''
  #     else
  #       label(field_name, options[:label], :class => options[:label_class])
  #     end
  #   end



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
