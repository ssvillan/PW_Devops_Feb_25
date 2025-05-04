from selenium import webdriver

# Launch Chrome
driver= webdriver.Chrome()

#open facebook
driver.get("https://www.facebook.com/")

# find elements by their traditional locators
driver.find_element("id","email").send_keys("your_email_here")
driver.find_element("id","pass").send_keys("your_password")
driver.find_element("name","login").click()

driver.implicitly_wait(5)

driver.quit()

