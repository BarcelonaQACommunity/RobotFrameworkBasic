# -*- coding: utf-8 -*-
import requests

class HttpBinCode (object):
	def __init__(self):
		self.req = requests.Session()
	def Get_Status(self,status):
		return self.req.get("http://httpbin.org/status/" + str(int(status)+1))

if __name__ == "__main__":
	a = HttpBinCode()
	print a.Get_Status(417)
