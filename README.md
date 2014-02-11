# Thoughtworks Coding Challenge

## PROBLEM TWO: SALES TAXES
***
 Basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical products that are exempt. Import duty is an additional sales tax applicable on all imported goods at a rate of 5%, with no exemptions.

When I purchase items I receive a receipt which lists the name of all the items and their price (including tax), finishing with the total cost of the items, and the total amounts of sales taxes paid.  The rounding rules for sales tax are that for a tax rate of n%, a shelf price of p contains (np/100 rounded up to the nearest 0.05) amount of sales tax.

Write an application that prints out the receipt details for these shopping baskets...
***
### INPUT:

Input 1:
>1 book at 12.49  
>1 music CD at 14.99  
>1 chocolate bar at 0.85  

Input 2:
>1 imported box of chocolates at 10.00  
>1 imported bottle of perfume at 47.50  

Input 3:
>1 imported bottle of perfume at 27.99  
>1 bottle of perfume at 18.99  
>1 packet of headache pills at 9.75  
>1 box of imported chocolates at 11.25  

### OUTPUT

Output 1:
>1 book : 12.49  
>1 music CD: 16.49  
>1 chocolate bar: 0.85  
>Sales Taxes: 1.50  
>Total: 29.83  

Output 2:
>1 imported box of chocolates: 10.50  
>1 imported bottle of perfume: 54.65  
>Sales Taxes: 7.65  
>Total: 65.15  

Output 3:
>1 imported bottle of perfume: 32.19  
>1 bottle of perfume: 20.89  
>1 packet of headache pills: 9.75  
>1 imported box of chocolates: 11.85  
>Sales Taxes: 6.70  
>Total: 74.68  
  
***

### Run the program
`$ ruby lib/output.rb data/<filename>.txt`  
*Note*: All text files are placed in the `data` folder. 

**Input Files**:
- input1.txt
- input2.txt
- input3.txt
  

### TDD done with `rspec` - (Unit and Integration tests)
**Spec files:**
- lineitem_spec.rb 
- output_spec.rb 
- receipt.rb  

To run individual test: 
`$ rspec spec/<filename>.rb` 

To run all tests:  `$ rspec` 

### Design 
Problem is broken down into 3 classes
- Lineitem
- Receipt
- Output

LineItem breaks down the input and organize each line item by quantity, price and product. The class also takes into consideration goods that are exempt from sales tax(10%), and all imported goods, which are taxed 5%.

Receipt takes an input, calculates the appropriate tax for each line item, and prints it.

Output runs the program
