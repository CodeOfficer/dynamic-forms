Bootstrapper.for :development do |b|
  b.truncate_tables :asset_templates
  Factory.create(:asset_template_with_no_form_data)
  Factory.create(:asset_template_with_text)
  Factory.create(:asset_template_with_textarea)
  Factory.create(:asset_template_with_radio)
  Factory.create(:asset_template_with_select)
  Factory.create(:asset_template_with_checkbox)
  Factory.create(:asset_template_with_all_form_data)
end

Bootstrapper.for :production do |b|
end

Bootstrapper.for :test do |b|
end

