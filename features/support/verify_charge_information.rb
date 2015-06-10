def charges_section_verify_charge_company_name_address
  expect(content).to have_content('Lender')
  @title[:charges].each do |charges|
    charges[:charge].each do |charge|
      check_charge_company_name_address(charge)
    end
  end
end

def charges_section_verify_charge_company_name_address_not_displayed
  expect(content).to_not have_content('Lender')
end

def charge_company_name_not_displayed(charge)
  expect(content).not_to include(charge[:charge_company_name])
end

def check_charge_company_address_not_displayed(charge)
  expect(content).not_to include(charge[:charge_company_address])
end

def check_charge_company_name_address(charge)
  expect(content).to have_content(charge[:charge_company_name])
  expect(content).to have_content(charge[:charge_company_address])
end

def check_charge_company_name_address_not_displayed(charge)
  expect(content).to_not have_content(charge[:charge_company_name])
  expect(content).to_not have_content(charge[:charge_company_address])
end
