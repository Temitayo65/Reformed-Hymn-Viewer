import os
from os import listdir
from os.path import isfile, join

"""arr = os.listdir()
hymn_arr = [hymn for hymn in arr if hymn.startswith("hymn") and not hymn.endswith(".py")]
modified_arr = []
for hymn in hymn_arr:
    first_name = hymn.split(".pdf")[0]
    second_name = (' '.join(first_name.split("_"))).split('hymn')[1]
    final_name = "Hymn " + second_name
    # os.rename(hymn, final_name) # this changes the previous name of the file to the new name
    modified_arr.append(final_name)
modified_arr.sort(key = lambda hymn: int(hymn.split()[1]))
print(modified_arr)"""


# This code should not be run on your system
arr = os.listdir()
hymn_arr = [hymn for hymn in arr if hymn.startswith("Hymn") and not hymn.endswith(".py")]
for hymn in hymn_arr:
    os.rename(hymn, hymn + ".pdf")
