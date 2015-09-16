@official_copy
Feature: Legal requirement updates made to Official Copy of the Register

	Background:
		Given I am an initial private beta user
		And I have logged in
		When I attempt to view the Official Copy of the Register for a title
		And the PDF is displayed

	@US215
	Scenario: Dates are displayed in human readable format on official copy
		Then I can see the edition date in the correct format
		And I can see the dates of the entries on the register in the correct format

	@US204
	Scenario: Class of title is displayed on the Official Copy of the Register
		Then I can see the class of the title in the proprietorship register

	@US205
	Scenario: ‘End of register’ added to the end of the Official Copy of the Register document
		Then End of register is displayed on the last page of the PDF

	@US206
	Scenario: Title number appears on every page of Official Copy of the Register
		Then I can see the Title number of every page

	@US197
	Scenario: Reference to section 67 is added to Official Copy of the Register
		Then I can see "Under s.67 of the Land Registration Act 2002, this copy is admissible in evidence to the same extent as the original." is displayed on the PDF

	@US198
	Scenario: Issued by LR statement added to Official Copy of the Register
		Then I can see Land Registry Identification displayed on the top of the PDF

	@US200
	Scenario: All entry dates follow the UK format on the Official Copy of the Register
		Then I can see that all entry dates are displayed in the UK format

	@US199
	Scenario: Wording changed from ‘The’ to ‘Any’ in statement in Official Copy of the Register
		Then I can see that the explanation text "Any date at the beginning of an entry is the date on which the entry was made in the register." is displayed
