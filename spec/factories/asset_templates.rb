
#  -----------------------------------------------------------------------------
# http://thoughtbot.com/projects/factory_girl
# http://github.com/thoughtbot/factory_girl/tree/master
#  -----------------------------------------------------------------------------

# INPUTS
# checkbox
# hidden
# password
# radio
# text
# ...
# textarea
# select
# ...
# label
# class
# name
# value

Factory.sequence :asset_template_name do |n|
  "template name ##{n}"
end

Factory.sequence :text do |n|
  {
    :type     => "text",
    :name     => "text_field_#{n}", 
    :label    => "Text Field ##{n}", 
    :value    => ""
  }  
end

Factory.sequence :textarea do |n|
  {
    :type     => "textarea",
    :name     => "textarea_field_#{n}", 
    :label    => "Textarea Field ##{n}", 
    :value    => ""
  }  
end

Factory.sequence :radio do |n|
  {
    :type     => "radio",
    :name     => "radio_field_#{n}",
    :label    => "Radio Field ##{n}",
    :value    => "",
    :options => [
      "Radio #1", 
      "Radio #2", 
      "Radio #3"
    ]
  }
end

Factory.sequence :checkbox do |n|
  {
    :type     => "checkbox",
    :name     => "checkbox_field_#{n}",
    :label    => "Checkbox Field ##{n}",
    :value    => "",
    :options => [
      "Checkbox #1", 
      "Checkbox #2", 
      "Checkbox #3"
    ]
  }
end

Factory.sequence :select do |n|
  {
    :type     => "select",
    :name     => "select_field_#{n}",
    :label    => "Select Field ##{n}",
    :value    => "",
    :options => [
      "Select #1", 
      "Select #2", 
      "Select #3"
    ]
  }
end

#  -----------------------------------------------------------------------------

Factory.define :asset_template_with_no_form_data, :class => AssetTemplate do |f|
  f.name      { Factory.next(:asset_template_name) + " (asset_template_with_no_form_data)" }
  f.form_data [ ]
end

Factory.define :asset_template_with_text, :class => AssetTemplate do |f|
  f.name      { Factory.next(:asset_template_name) + " (asset_template_with_text)" }
  f.form_data { [ Factory.next(:text) ] }
end

Factory.define :asset_template_with_textarea, :class => AssetTemplate do |f|
  f.name      { Factory.next(:asset_template_name) + " (asset_template_with_textarea)" }
  f.form_data { [ Factory.next(:textarea) ] }
end

Factory.define :asset_template_with_radio, :class => AssetTemplate do |f|
  f.name      { Factory.next(:asset_template_name) + " (asset_template_with_radio)" }
  f.form_data { [ Factory.next(:radio) ] }
end

Factory.define :asset_template_with_checkbox, :class => AssetTemplate do |f|
  f.name      { Factory.next(:asset_template_name) + " (asset_template_with_checkbox)" }
  f.form_data { [ Factory.next(:checkbox) ] }
end

Factory.define :asset_template_with_select, :class => AssetTemplate do |f|
  f.name      { Factory.next(:asset_template_name) + " (asset_template_with_select)" }
  f.form_data { [ Factory.next(:select) ] }
end
  
Factory.define :asset_template_with_all_form_data, :class => AssetTemplate do |f|
  f.name { Factory.next(:asset_template_name) + " (asset_template_with_all_form_data)" }
  f.form_data do
    [
      Factory.next(:text),
      Factory.next(:textarea),
      Factory.next(:radio),
      Factory.next(:checkbox),
      Factory.next(:select)
    ]
  end
end