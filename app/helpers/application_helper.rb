# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  # form builders --------------------------------------------------------------
  def template_form_for(*args, &block)
    options = args.extract_options!.merge(:builder => TemplateFormBuilder)
    form_for(*(args + [options]), &block)
  end
  
end
