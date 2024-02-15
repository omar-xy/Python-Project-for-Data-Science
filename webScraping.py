import pandas as pd
import requests as rq
from bs4 import BeautifulSoup
import warnings
# Ignore all warnings
warnings.filterwarnings("ignore", category=FutureWarning)


url='https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-PY0220EN-SkillsNetwork/labs/project/amazon_data_webpage.html'
data=rq.get(url).text
soup=BeautifulSoup(data, 'html5lib')
tag_obj = soup.title
print(tag_obj)

amzon_data = pd.DataFrame(columns=["Date", "Open", "High", "Low", "Close", "Volume"])

# First we isolate the body of the table which contains all the information
# Then we loop through each row and find all the column values for each row
for row in soup.find("tbody").find_all('tr'):
    col = row.find_all("td")
    date = col[0].text
    Open = col[1].text
    high = col[2].text
    low = col[3].text
    close = col[4].text
    volume = col[5].text

# Finally we append the data of each row to the table
amzon_data = amzon_data._append({"Date":date, "Open":Open, "High":high, "Low":low, "Close":close, "Volume":volume}, ignore_index=True)
print(amzon_data.head())