
#  -----------------------------------------------------------------------------
# http://thoughtbot.com/projects/factory_girl
# http://github.com/thoughtbot/factory_girl/tree/master
#  -----------------------------------------------------------------------------

Factory.sequence :asset_template_name do |n|
  "template name ##{n}"
end

Factory.sequence :text do |n|
  [ "text", "Text Field ##{n}", "text_field_#{n}", "" ]
end

Factory.sequence :textarea do |n|
  [ "textarea", "Textarea Field ##{n}", "textarea_field_#{n}", "" ]
end

Factory.sequence :radio do |n|
  [ "radio",
    "Radio Field ##{n}",
    "radio_field_#{n}",
    {
      "radio_1" => "Radio #1", 
      "radio_2" => "Radio #2", 
      "radio_3" => "Radio #3"
    },
    ""
  ]
end

Factory.sequence :checkbox do |n|
  [ "checkbox",
    "Checkbox Field ##{n}",
    "checkbox_field_#{n}",
    {
      "checkbox_1" => "Checkbox #1", 
      "checkbox_2" => "Checkbox #2", 
      "checkbox_3" => "Checkbox #3"
    },
    ""
  ]
end

Factory.sequence :select do |n|
  [ "select",
    "Select Field ##{n}",
    "select_field_#{n}",
    {
      "select_1" => "Select #1", 
      "select_2" => "Select #2", 
      "select_3" => "Select #3"
    },
    ""
  ]
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