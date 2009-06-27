Bootstrapper.for :development do |b|
  b.truncate_tables :templates
  Factory.create(:template_with_no_form_data)
  Factory.create(:template_with_text)
  Factory.create(:template_with_textarea)
  Factory.create(:template_with_radio)
  Factory.create(:template_with_select)
  Factory.create(:template_with_checkbox)
  Factory.create(:template_with_all_form_data)
end

Bootstrapper.for :production do |b|
end

Bootstrapper.for :test do |b|
end

