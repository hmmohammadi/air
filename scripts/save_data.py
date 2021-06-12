import pandas as pd
import sys
import os
from stats import Stats
from datetime import date

class Record:
    def __init__(self):
        self.df = 0
        self.stats = 0
        # pass


    def save(self, index):

        # get data by index
        if index == 0:
            self.stats = Stats(100)
            # pass
        elif index == 1:
            self.stats = Stats(150)
            # pass
        elif index == 2:
            self.stats = Stats(200)
            # pass
        elif index == 3:
            self.stats = Stats(300)
            # pass
        elif index == 4:
            self.stats = Stats(350)
            # pass
        elif index == 5:
            self.stats = Stats(500)
            # pass
        else:
            print("ERROR: no valid index")
        # pass

        # Casting <dict> to Pandas DataFrame
        self.df = pd.DataFrame(self.stats.response)
        self.df = self.df[self.df.columns[::-1]]

        if sys.platform == "linux":
            print("Linux")
            today = date.today()
            path = os.path.join('/tmp', today.strftime("%b-%d-%Y")+"data.xlsx")
            
            self.df.to_excel(path, index=False)


            pass
        elif sys.platform == "win32":
            pass
        elif sys.platform == "darwin":
            pass
    
    def __str__(self) -> str:
        return f"{self.df}"     



if __name__=="__main__":
    record = Record()
    record.save(0)
    print(record.__str__())
    print(sys.platform)


