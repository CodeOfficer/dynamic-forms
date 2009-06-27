require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

#  -----------------------------------------------------------------------------
# http://madhatted.com/2008/7/10/rspec-real-world-testing
#  -----------------------------------------------------------------------------

describe Template do
  
  before(:all) do
    @template_with_no_form_data    = Factory.create(:template_with_no_form_data)
    @template_with_text       = Factory.create(:template_with_text)
    @template_with_textarea   = Factory.create(:template_with_textarea)
    @template_with_radio      = Factory.create(:template_with_radio)
    @template_with_checkbox   = Factory.create(:template_with_checkbox)
    @template_with_select     = Factory.create(:template_with_select)
    @template_all_form_data   = Factory.create(:template_with_all_form_data)
  end

  it "should create a new instance given valid attributes" do
    @template_with_no_form_data.should  be_an_instance_of(Template)
    @template_with_text.should          be_an_instance_of(Template)
    @template_with_textarea.should      be_an_instance_of(Template)
    @template_with_radio.should         be_an_instance_of(Template)
    @template_with_checkbox.should      be_an_instance_of(Template)
    @template_with_select.should        be_an_instance_of(Template)
    @template_all_form_data.should      be_an_instance_of(Template)
  end 

  it "should be valid" do
    @template_with_no_form_data.should  be_valid
    @template_with_text.should          be_valid
    @template_with_textarea.should      be_valid
    @template_with_radio.should         be_valid
    @template_with_checkbox.should      be_valid
    @template_with_select.should        be_valid
    @template_all_form_data.should      be_valid
  end 
  
  context "template with no form data" do
    
    it "should have no form data" do
      @template_with_no_form_data.form_data.should == []
    end
    
  end
  
end
 