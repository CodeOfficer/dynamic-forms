
#  -----------------------------------------------------------------------------
# http://thoughtbot.com/projects/factory_girl
# http://github.com/thoughtbot/factory_girl/tree/master
#  -----------------------------------------------------------------------------

Factory.sequence :template_name do |n|
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

Factory.define :template_with_no_form_data, :class => Template do |f|
  f.name      { Factory.next(:template_name) }
  f.form_data [ ]
end

Factory.define :template_with_text, :class => Template do |f|
  f.name      { Factory.next(:template_name) }
  f.form_data { [ Factory.next(:text) ] }
end

Factory.define :template_with_textarea, :class => Template do |f|
  f.name      { Factory.next(:template_name) }
  f.form_data { [ Factory.next(:textarea) ] }
end

Factory.define :template_with_radio, :class => Template do |f|
  f.name      { Factory.next(:template_name) }
  f.form_data { [ Factory.next(:radio) ] }
end

Factory.define :template_with_checkbox, :class => Template do |f|
  f.name      { Factory.next(:template_name) }
  f.form_data { [ Factory.next(:checkbox) ] }
end

Factory.define :template_with_select, :class => Template do |f|
  f.name      { Factory.next(:template_name) }
  f.form_data { [ Factory.next(:select) ] }
end
  
Factory.define :template_with_all_form_data, :class => Template do |f|
  f.name { Factory.next(:template_name) }
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