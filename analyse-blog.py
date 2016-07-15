import collections
import urllib 
import urllib2
import re
import json
import datetime
import pytz

# Exclude IP which is from Office/Home to track other's Visits
exclude_ip = ['1.2.3.4','1.2.3.5'] 

def findnth(haystack, needle, n):
	parts= haystack.split(needle, n+1)
	if len(parts)<=n+1:
		return -1
	return len(haystack)-len(parts[-1])-len(needle)

def getUrls(log):
	logfile = open(log,"r")
	clean_log=[]
	for line in logfile:
		try:
			for ip in exclude_ip : 
				if line.find(ip) == -1 :
					clean_log.append(line[line.index("GET")+4:line.index("HTTP")])
		except:
			pass
	logfile.close()
	return clean_log


def getCounts(log):
	counter = collections.Counter(log)
	return counter


def getTotalCounts(cleanlog):
	
	output = ''
	category=[]
	category_log=[]
	category_pattern = re.compile('^\/$')
	for line in clean_log:
		line = urllib.unquote(line).decode('utf8')
		line = line.strip(' \n\r\t\f')
		if category_pattern.search(line):
			category.append(line)
	count_category = collections.Counter(category)
	for count in count_category.most_common(3):
		output = output + "Total visitors : "+str(count[1]) + '\n'
	return output


# Path to log file
clean_log = getUrls("mywebsite.example.com")

#Outputs

output = "************My website Update**************" + '\n' +"Date : " + str(datetime.datetime.now(pytz.timezone('Asia/Kolkata')).date())  + '\n' + getTotalCounts(clean_log)
print output

