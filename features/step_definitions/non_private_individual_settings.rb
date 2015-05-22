Given(/^the digital register is setup to only show non private individual owners$/) do
  ENV['SHOW_PRIVATE_PROPRIETORS'] = 'false'
end

Given(/^the digital register is setup to also show private individual owners$/) do
  ENV['SHOW_PRIVATE_PROPRIETORS'] = 'true'
end
