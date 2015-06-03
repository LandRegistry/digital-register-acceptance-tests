Given(/^I have a title that has one mortgage$/) do
  insert_title_with_multiple_charges(number_of_charges: 1)
end

Given(/^I have a title that has multiple mortgages$/) do
  insert_title_with_multiple_charges(number_of_charges: 2)
end

Given(/^I have a title that has one mortgage with multiple addresses$/) do
  insert_title_with_multiple_charges_and_addresses(n_of_charge_addresses: 2)
end

Given(/^I have a title that has a sub mortgage$/) do
  insert_title_with_a_sub_charge
end

Then(/^I do not see the sub mortgagor’s name of the in the summary box for the selected title$/) do
  summary_box_verify_charge_company_name_not_displayed
end

Then(/^I do not see the sub mortgagor’s name and contact details as they are displayed on the register$/) do
  charges_section_verify_charge_company_name_address_not_displayed
end

Given(/^I have a title with no lenders$/) do
  insert_title_with_no_charges
end

Then(/^I can see the Lenders and their contact details in the order they are displayed on the register$/) do
  summary_box_verify_charge_company_name
  charges_section_verify_charge_company_name_address
end

Then(/^I can see the Lender’s names in the summary box for the selected title$/) do
  summary_box_verify_charge_company_name
end

Then(/^I can see the Lender’s name in the summary box for the selected title$/) do
  summary_box_verify_charge_company_name
end

Then(/^I see a no name or address information with regards to Lenders$/) do
  summary_box_verify_charge_company_name_not_displayed
  charges_section_verify_charge_company_name_address_not_displayed
end
