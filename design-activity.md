What classes does each implementation include? Are the lists the same?
  Implementation A: CartEntry, ShoppingCart, Order
  Implementation B: CartEntry, ShoppingCart, Order
  The lists are the same

Write down a sentence to describe each class.
  CartEntry - creates an item/entry to go in the cart
  ShoppingCart - Holds entries
  Order - calculates the total price of a cart

How do the classes relate to each other? It might be helpful to draw a diagram on a whiteboard or piece of paper.
instances of CartEntry hold an item and a price, which are stored in an instance of ShoppingCart. Order iterates through the entries in ShoppingCart to find the total cost of all entries in the cart.

What data does each class store? How (if at all) does this differ between the two implementations?
  Implementation A:
    CartEntry: quantity, price
    ShoppingCart: array of entries
    Order: instance of shopping cart, and total price of cart

  Implementation B:
    CartEntry: quantity and price of an item, and the total price for that quantity
    ShoppingCart: array of entries, and total price of the shopping cart entries
    Order: the instance of shopping cart, and the total including tax

What methods does each class have? How (if at all) does this differ between the two implementations?

  Implementation A:
    CartEntry: initialize
    ShoppingCart: initialize
    Order: initialize, total_price

  Implementation B:
    CartEntry: initialize, price
    ShoppingCart: initialize, price
    Order: initialize, total_price

    B keeps track of the price at every level, not all calculated at the end

Consider the Order#total_price method. In each implementation:
  Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry, or is it retained in Order?
    A: retained in order
    B: delegated to lower level classes

  Does total_price directly manipulate the instance variables of other classes?
  neither implementation directly manipulates instance variables of other classes

If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?

Implementation B would be easier to modify since the price is already calculated at a lower level, and Order wouldn't need to know about the quantity in CartEntry in order to apply the discount. The code could be adjusted at CartEntry price method.

Which implementation better adheres to the single responsibility principle?
Implementation B

Bonus question once you've read Metz ch. 3: Which implementation is more loosely coupled?
Implementation B
