# -*- coding: utf-8 -*-
import requests

class HttpBinCookies (object):
	def __init__(self):
		self.req = requests.Session()
	def Get_Cookies(self):
		'''
		return the dictionary with the cookies
		'''
		resp = self.req.get("http://httpbin.org/cookies")
		temp = resp.json()
		return temp["cookies"]


	def Set_Cookies_Defined(self):
		return self.req.get("http://httpbin.org/cookies/set?QAMeetup=QA_Barcelona&QASession=2nd")


if __name__ == "__main__":
	a = HttpBinCookies()
	a.Set_Cookies_Defined()
	print a.Get_Cookies()
