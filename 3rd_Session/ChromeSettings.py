from robot.api.deco import keyword
from selenium import webdriver

@keyword('SET CHROME OPTION')
def create_driver():
    profile_val = {"password_manager_enabled": False}
    prefs_val = {"credentials_enable_service": False, 'profile': profile_val}

    chromeOptions = webdriver.ChromeOptions()
    prefs = {
            "credentials_enable_service": False,
            'profile':
                        {
                        'password_manager_enabled': False
                        }
            }
    chromeOptions.add_argument("disable-infobars")
    chromeOptions.add_experimental_option("prefs",prefs)
    
    return chromeOptions