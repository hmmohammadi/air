import pandas as pd
import sys
import os
from .stats import Stats
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
            
            writer = pd.ExcelWriter(path, engine="xlsxwriter")
            
            # upperCase
            self.df.columns = map(lambda x: str(x).upper(), self.df.columns)

            self.df.to_excel(writer, sheet_name="gases")

            

            # Get the xlsxwriter workbook and worksheet objects.
            workbook = writer.book
            worksheet = writer.sheets['gases']

            # Add a header format

            header_format = workbook.add_format({
                'bold': True,
                'text_wrap': True,
                'valign': 'top',
                'fg_color': '#D7E4BC',
                'border': 1})
            
            # Write the column headers with the defined format.
            for col_num, val in enumerate(self.df.columns.values):
                worksheet.write(0, col_num + 1, val, header_format)
            
            for col in self.df:
                col_width = max(self.df[col].astype(str).map(len).max(), len(col))
                col_idx = self.df.columns.get_loc(col)
                writer.sheets['gases'].set_column(col_idx, col_idx+10, col_width)
            
            # worksheet.set
            writer.save()


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
    # print(record.__str__())
    # print(sys.platform)


