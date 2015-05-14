Given(/^I have a title that has one mortgage$/) do
  @title_hash = insert_title_with_multiple_charges(number_of_charges: 1)
end

Then(/^I can see the Lender’s name in the summary box for the selected title$/) do
  content = page.body.text
  within('div callout callout--summary') do
    expect(content).to include('Lender(s)')
    expect(content).to include(@title_hash[:charges][0][:charge][0][:charge_company_name])
  end
end

Then(/^I can see the Lender’s name and contact details as they are displayed on the register$/) do
  content = page.body.text
  within('div grid-wrapper') do
    expect(content).to include('Charge details')
    expect(content).to include(@title_hash[:charges][0][:charge][0][:charge_company_name])
    expect(content).to include(@title_hash[:charges][0][:charge][0][:charge_company_address])
  end
end

Given(/^I have a title that has multiple mortgages$/) do
  @title_hash = insert_title_with_multiple_charges(number_of_charges: 2)
end

Then(/^I can see all the Lender’s in the summary box for the selected title$/) do
  content = page.body.text
  within('div callout callout--summary') do
    expect(content).to include('Lender(s)')
    expect(content).to include(@title_hash[:charges][0][:charge][0][:charge_company_name])
    expect(content).to include(@title_hash[:charges][1][:charge][0][:charge_company_name])
  end
end

Then(/^I can see all the Lender’s and their contact details in the order they are displayed on the register$/) do
  content = page.body.text
  within('div grid-wrapper') do
    expect(content).to include('Charge details')
    expect(content).to include(@title_hash[:charges][0][:charge][0][:charge_company_name])
    expect(content).to include(@title_hash[:charges][0][:charge][0][:charge_company_address])
    expect(content).to include(@title_hash[:charges][1][:charge][0][:charge_company_name])
    expect(content).to include(@title_hash[:charges][1][:charge][0][:charge_company_address])
  end
end

Given(/^I have a title that has one mortgage with multiple addresses$/) do
  @title_hash = insert_title_with_multiple_charges_and_addresses(n_of_charge_addresses: 2)
end

Given(/^I have a title that has a sub mortgage$/) do
  @title_hash = insert_title_with_a_sub_charge
end

Then(/^I do not see the sub mortgagor’s name of the in the summary box for the selected title$/) do
  content = page.body.text
  within('div callout callout--summary') do
    content.should_not include(@title_hash[:charges][0][:charge][0][:charge_company_name])
  end
end

Then(/^I do not see the sub mortgagor’s name and contact details as they are displayed on the register$/) do
  content = page.body.text
  within('div grid-wrapper') do
    content.should_not include(@title_hash[:charges][0][:charge][0][:charge_company_name])
    content.should_not include(@title_hash[:charges][0][:charge][0][:charge_company_address])
  end
end

Given(/^I have a title with no lenders$/) do
  @title_hash = insert_title_with_owners
end

Then(/^I see a no information with regards to Lenders$/) do
  content = page.body.text
  within('div callout callout--summary') do
    expect(content).to include('Lender(s)')
  end
  within('div grid-wrapper') do
    expect(content).to include('Charge details')
  end
end
