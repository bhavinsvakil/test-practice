require_relative 'spec_helper'
require_relative '../pages/login'
require "byebug"


 describe 'Login' do

  before(:each) do
    @login = Login.new(@driver)
  end

  it 'succeeded' do
    @login.login_with('tomsmith', 'SuperSecretPassword!')
    @login.success_message.should be true
    success_message = @driver.find_element(id: 'flash-messages').text
    expect(success_message). to include('You logged into a secure area!')
  end

   it 'failed' do
     @login.login_with('tomsmith', 'hahaha')
     @login.failure_message.should be true
   end
 end