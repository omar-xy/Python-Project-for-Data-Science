from bs4 import BeautifulSoup # this module helps in web scrapping.
import requests

# soup = BeautifulSoup(requests.get('https://www.cricbuzz.com/cricket-match/live-scores').text, 'html5lib')
html="<!DOCTYPE html><html><head><title>Page Title</title></head><body><h3><b id='boldest'>Lebron James</b></h3><p> Salary: $ 92,000,000 </p><h3> Stephen Curry</h3><p> Salary: $85,000, 000 </p><h3> Kevin Durant </h3><p> Salary: $73,200, 000</p></body></html>"
#  To parse a document, pass it into the BeautifulSoup constructor. The BeautifulSoup object represents the document as a nested data structure:
soup = BeautifulSoup(html, 'html5lib')
# We can use the method prettify() to display the HTML in the nested structure:
# print(soup.prettify())


# The tag object corresponds to an HTML tag in the original document.
tag_obj = soup.title
# print('this is the title', tag_obj)
# print('this is the type ', type(tag_obj))


# children, Parents, siblings
# tag_parent = tag_obj.parent
# print(tag_parent)

# sibling_1 =tag_obj.next_sibling
# print(sibling_1)
# sibling_2 =sibling_1.next_sibling
# # print(sibling_2)
# tag_child = tag_obj.b
# tag_child.get('id')
table="<table><tr><td id='flight'>Flight No</td><td>Launch site</td> <td>Payload mass</td></tr><tr> <td>1</td><td><a href='https://en.wikipedia.org/wiki/Florida'>Florida<a></td><td>300 kg</td></tr><tr><td>2</td><td><a href='https://en.wikipedia.org/wiki/Texas'>Texas</a></td><td>94 kg</td></tr><tr><td>3</td><td><a href='https://en.wikipedia.org/wiki/Florida'>Florida<a> </td><td>80 kg</td></tr></table>"
tb_bs = BeautifulSoup(table, 'html5lib')
tabl_rows= tb_bs.find_all('tr')
print(tabl_rows)
fr_row = tabl_rows[0]
print('\n')
print(fr_row)