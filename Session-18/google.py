from selenium import webdriver

# Launch Chrome
driver= webdriver.Chrome()

#open facebook
driver.get("https://www.google.com/")

# find elements by their traditional locators
search_box=driver.find_element("name","q")
search_box.send_keys("OpenAI ChatGPT")

search_box.submit()

driver.implicitly_wait(10)

print("Page Title:",driver.title)


driver.quit()

