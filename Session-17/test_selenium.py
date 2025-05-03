from selenium import webdriver

driver=webdriver.Chrome()
driver.get('https://www.facebook.com')
assert "Facebook – log in or sign up" in driver.title


# open a facebook.com / amazon.com and check its title using selenium
# before running this code install selenium
# pip install selenium