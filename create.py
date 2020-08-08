import sys
import os
from selenium import webdriver
import getpass


PATH = "C:/Users/AlexN/Documents/Python Projects"
BROWSER = webdriver.Chrome()
BROWSER.get('http://github.com/login')


def create():
    folder_name = str(sys.argv[1])

    # Login to github
    username_button = BROWSER.find_element_by_xpath("//*[@id='login_field']")
    username_button.click()
    username_button.send_keys('alex-t-nguyen')
    password_button = BROWSER.find_element_by_xpath("//*[@id='password']")
    password_button.click()
    password = getpass.getpass("Password for \'https://alex-t-nguyen@github.com\': ")
    password_button.send_keys(password)
    login_button = BROWSER.find_element_by_xpath("//*[@id='login']/form/div[4]/input[9]")
    login_button.submit()

    # Navigate to new repository webpage
    BROWSER.get('https://github.com/new')

    # Create new repository
    repository_button = BROWSER.find_element_by_xpath("//*[@id='repository_name']")
    repository_button.send_keys(folder_name)
    create_repo_button = BROWSER.find_element_by_xpath("//*[@id='new_repository']/div[4]/button")
    create_repo_button.submit()

    # Close browser
    BROWSER.quit()

if __name__ == "__main__":
    create()
