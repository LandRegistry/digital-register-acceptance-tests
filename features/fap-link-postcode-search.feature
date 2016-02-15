@US315
Feature: link to FaP if user doesn’t know postcode

As a customer
I want to be easily able to move to the FaP service when I realise that the DRV search requires a postcode and I do not know the one for the property that I am interested in
So that I can find the documents that I require as easily as possible

Add 'don't know postcode' expandable explanation box and link back to FaP - https://drv-ux-prototype.herokuapp.com/drv-15/search.


Scenario: link to FaP if user doesn’t know postcode

  Given I am on the property search page
  And I don’t know the postcode
  When I click the by street address link
  Then I can access FaP
