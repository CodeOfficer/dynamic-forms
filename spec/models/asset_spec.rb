require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Asset do
  before(:each) do
    @valid_attributes = {
    }
  end

  it "should create a new instance given valid attributes" do
    Asset.create!(@valid_attributes)
  end
end
 


  # before(:each) do
  #   @bank_account = BankAccount.create
  #   @bank_account.balance = 0
  # end
  #  
  # it "should increase the balance upon deposit" do
  #   @bank_account.deposit(100)
  #   @bank_account.balance.should == 100
  # end
  
  # @bank_account = Factory(:bank_account, :balance => 0)