from bs4 import BeautifulSoup
from urllib.request import urlopen
import urllib.request, urllib.parse, urllib.error
import ssl
import re

ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

# creating a pdf downloader function
def download_file(download_url, filename):
    response = urllib.request.urlopen(download_url)
    file = open(filename + ".pdf", 'wb')
    file.write(response.read())
    file.close()

# create a file to save the pdf links in
fh = open("hymn_pdf_links.txt",'w')

url = "https://hymns.countedfaithful.org/numberListing.php"
page = urlopen(url) # open the page
html = page.read().decode("utf-8") # read the html content of the page
soup = BeautifulSoup(html, 'html.parser') # precursor for getting the href tags containing all links
tags = soup('a') # extracting all anchor tags
for tag in tags: # iterating through all anchor tags
    link = str(tag.get("href", None)) # getting each link
    link = link.strip() # removing \n from link
    if link.endswith(".pdf"): # ensuring only pdf links are extracted
        fh.write(str(link) + '\n') # writing the links in the text file
        file_name = link[link.find("hymnpdfs/") + 9 : link.find(".pdf")]
        download_file(link,file_name)
fh.close()




# 905 hymns
