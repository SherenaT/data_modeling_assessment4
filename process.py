log_file = open("um-server-01.txt") #assigning log_file to a variable and the value opens "um-server-01.txt" file


def sales_reports(log_file): #defining a function. The function name is 'sales_reports' and parameter is 'log_file' variable
     for line in log_file: #looping over variable 'log_file', line is the iteration of each loop
         line = line.rstrip() # reassign line value with method rstip which removes any trailing characters at the end a string.
         day = line[0:3] #assign like 0:3 to have the value of day
         if day == "Mon": #conditional statement if day = 'Tues' >> changed to "Mon"
             print(line) #if condition is met print line to console

#EXTRA CREDIT In process.py, write another function that prints out all the melon orders that delivered over 10 melons
def melon_orders(log_file):
     for line in log_file:
         line = line.split(',').rstrip() 
         orders = int(line[2]) 
         if orders > 10: 
             print(line)

sales_reports(log_file)
melon_orders(log_file)
