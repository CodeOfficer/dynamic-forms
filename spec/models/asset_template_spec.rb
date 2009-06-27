require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

#  -----------------------------------------------------------------------------
# http://madhatted.com/2008/7/10/rspec-real-world-testing
#  -----------------------------------------------------------------------------

describe AssetTemplate do
  
  context "template with no form data" do
    before(:each) do
      @asset_template_with_no_form_data = Factory.create(:asset_template_with_no_form_data)
    end

    it "should be valid" do
      @asset_template_with_no_form_data.should be_valid
    end 
    
    it "should have no form data" do
      @asset_template_with_no_form_data.form_data.should == []
    end
  end
  
  context "template with text" do
    before(:each) do
      @asset_template_with_text = Factory.create(:asset_template_with_text)
    end

    it "should be valid" do
      @asset_template_with_text.should be_valid
    end 
  end
  
  context "template with textarea" do
    before(:each) do
      @asset_template_with_textarea = Factory.create(:asset_template_with_textarea)
    end

    it "should be valid" do
      @asset_template_with_textarea.should be_valid
    end 
  end
  
  context "template with radio" do
    before(:each) do
      @asset_template_with_radio = Factory.create(:asset_template_with_radio)
    end

    it "should be valid" do
      @asset_template_with_radio.should be_valid
    end 
  end
  
  context "template with select" do
    before(:each) do
      @asset_template_with_select = Factory.create(:asset_template_with_select)
    end

    it "should be valid" do
      @asset_template_with_select.should be_valid
    end 
  end
  
  context "template with checkbox" do
    before(:each) do
      @asset_template_with_checkbox = Factory.create(:asset_template_with_checkbox)
    end

    it "should be valid" do
      @asset_template_with_checkbox.should be_valid
    end 
  end
  
  context "template with all form data" do
    before(:each) do
      @asset_template_with_all_form_data = Factory.create(:asset_template_with_all_form_data)
    end

    it "should be valid" do
      @asset_template_with_all_form_data.should be_valid
    end 
  end
  
end
 