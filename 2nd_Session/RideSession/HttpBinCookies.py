# -*- coding: utf-8 -*-
import requests

class HttpBinCookies (object):
	def __init__(self):
		self.req = requests.Session()
	def Get_Cookies(self):
		'''
		return the dictionary with the cookies
		'''
		
		##TODO
		return "should return a dictionary with the cookies"


	def Set_Cookies_Meetup(self):
		## Make a requests to the cookies/set setting the cookies:
		## name = value
		## QAMeetup = QA_Barcelona
		## QASession = 2nd

		pass