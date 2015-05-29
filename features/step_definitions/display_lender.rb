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
  within('div callout callout--summary') do
    content.should_not include(@title[:charges][0][:charge][0][:charge_company_name])
  end
end

Then(/^I do not see the sub mortgagor’s name and contact details as they are displayed on the register$/) do
  within('div grid-wrapper') do
    content.should_not include(@title[:charges][0][:charge][0][:charge_company_name])
    content.should_not include(@title[:charges][0][:charge][0][:charge_company_address])
  end
end

Given(/^I have a title with no lenders$/) do
  insert_title_with_owners
end

Then(/^I can see the Lenders and their contact details in the order they are displayed on the register$/) do
  within('div grid-wrapper') do
    expect(content).to include('Charge details')
    verify_charge_company_name_and_address
  end
end

Then(/^I can see the Lender’s names in the summary box for the selected title$/) do
  within('div callout callout--summary') do
    expect(content).to include('Lender(s)')
    verify_charge_company_name
  end
end

Then(/^I can see the Lender’s name in the summary box for the selected title$/) do
  within('div callout callout--summary') do
    expect(content).to include('Lender(s)')
    verify_charge_company_name
  end
end

Then(/^I see a no name or address information with regards to Lenders$/) do
  within('div callout callout--summary') do
    expect(content).to include('Lender(s)')
    charge_company_name_and_address_not_displayed
  end
  within('div grid-wrapper') do
    expect(content).to include('Charge details')
    charge_company_name_and_address_not_displayed
  end
end
