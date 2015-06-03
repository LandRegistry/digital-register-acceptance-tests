def summary_box_verify_charge_company_name
  expect(summary_box).to have_content('Lender(s)')
  @title[:charges].each do |charges|
    charges[:charge].each do |charge|
      summary_check_charge_company_name(charge)
    end
  end
end

def summary_box_verify_charge_company_name_not_displayed
  expect(summary_box).to_not have_content('Lender(s)')
  @title[:charges].each do |charges|
    charges[:charge].each do |charge|
      summary_charge_company_name_not_displayed(charge)
    end
  end
end

def charges_section_verify_charge_company_name_address
  expect(charges_section).to have_content('Charge details')
  @title[:charges].each do |charges|
    charges[:charge].each do |charge|
      check_charge_company_name_address(charge)
    end
  end
end

def charges_section_verify_charge_company_name_address_not_displayed
  expect(content).to_not have_content("Charge details")
end

def summary_box
  find("div.callout.callout--summary")
end

def charge_company_name_not_displayed(charge)
  expect(content).not_to include(charge[:charge_company_name])
end

def check_charge_company_address_not_displayed(charge)
  expect(content).not_to include(charge[:charge_company_address])
end

def charges_section
  find_by_id("charge-details")
end

def summary_check_charge_company_name(charge)
  expect(summary_box).to have_content(charge[:charge_company_name])
end

def check_charge_company_name_address(charge)
  expect(charges_section).to have_content(charge[:charge_company_name])
  expect(charges_section).to have_content(charge[:charge_company_address])
end

def summary_charge_company_name_not_displayed(charge)
  expect(summary_box).to_not have_content(charge[:charge_company_name])
end

def check_charge_company_name_address_not_displayed(charge)
  expect(charges_section).to_not have_content(charge[:charge_company_name])
  expect(charges_section).to_not have_content(charge[:charge_company_address])
end
