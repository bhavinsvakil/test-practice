require 'selenium-webdriver'
require 'byebug'

  describe 'Login_orchard' do

    before(:each) do
      @driver = Selenium::WebDriver.for :firefox
    end

    after(:each) do
      @driver.quit
    end

    it 'succeeded' do
      @driver.get 'http://oa.qaorch.com/'
      @driver.find_element(name: 'username').send_keys('bvakil')
      @driver.find_element(name: 'password').send_keys('bhavin@123')
      @driver.find_element(id: 'sign_in').submit
      byebug
      user_name= @driver.find_element(id: 'logged_in_user').text
      expect(user_name). to include ("Bhavin")
      expect(@driver.current_url). to eql ('http://oa.qaorch.com/relationships.php')
    end
  end