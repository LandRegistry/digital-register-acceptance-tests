@US150
Feature: Order multiple property search results when searching a postcode

As a citizen
I want property search results to be displayed in an order that is logical when I do a post code search
So that I can easily identify the property that I am interested in

Acceptance criteria:
  Only applied when a user has searched a postcode
  Results must be displayed in proper numerical order
  Results with leading information should be listed after numerical entries in alphabetical order

Scenario: Search by postcode properties on same street
  Given I have multiple addresses on the same street with different house numbers
  And I search for the property using their postcode
  Then the results are displayed in the order of the house numbers

Scenario: Search by postcode returns properties sorted by street, house and building details, and address_string
  Given I have the following addresses with the same postcode:
    | street_name | house_no | house_alpha | address_string | postcode |
    | Epsilon Street | 1 | | 1 Epsilon Street unstructured (PL9 8TB) | PL9 8TB |
    | Epsilon Street | 2 | A | 2A Epsilon Street (PL9 8TB) | PL9 8TB |
    | Epsilon Street | 2 |  | 2 Epsilon Street (PL9 8TB) | PL9 8TB |
    | Beta Street | | | land to the west of Beta Street (PL9 8TB) | PL9 8TB |
    | Beta Street | 2 | C | airspace above 2C Beta Street (PL9 8TB) | PL9 8TB |
  And I search for the property using their postcode
  Then the results should be displayed in the order:
    | address_string |
    | airspace above 2C Beta Street (PL9 8TB) |
    | land to the west of Beta Street (PL9 8TB) |
    | 1 Epsilon Street unstructured (PL9 8TB) |
    | 2 Epsilon Street (PL9 8TB) |
    | 2A Epsilon Street (PL9 8TB) |
