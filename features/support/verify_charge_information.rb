def verify_charge_company_name_and_address
  @title_hash[:charges].each do |charges|
    charges[:charge].each do |charge|
      check_charge_company_name(charge)
      check_charge_company_address(charge)
    end
  end
end

def charge_company_name_and_address_not_displayed
  @title_hash[:charges].each do |charges|
    charges[:charge].each do |charge|
      charge_company_name_not_displayed(charge)
      charge_company_address_not_displayed(charge)
    end
  end
end

def verify_charge_company_name
  @title_hash[:charges].each do |charges|
    charges[:charge].each do |charge|
      check_charge_company_name(charge)
    end
  end
end

def check_charge_company_name(charge)
  expect(content).to include(charge[:charge_company_name])
end

def check_charge_company_address(charge)
  expect(content).to include(charge[:charge_company_address])
end

def charge_company_name_not_displayed(charge)
  expect(content).should_not include(charge[:charge_company_name])
end

def check_charge_company_address_not_displayed(charge)
  expect(content).should_not include(charge[:charge_company_address])
end
