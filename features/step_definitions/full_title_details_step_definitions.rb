Then(/^I can see the full text of the register$/) do
  expect(content).to include 'Register name : '
  expect(content).to include 'A yearly rentcharge of £200 payable yearly on 1 January created by a Conveyance dated 17 January 2009 made between (1) JP Jones and (2) Heather Poole. The registered rentcharge is charged upon and issues out of the freehold land, shown edged red on the plan of the above title filed at the Registry being 21 Murhill Lane, Saltram Meadow, Plymouth, (PL9 7FN).'
end

Then(/^I can see the date of the register entry$/) do
  expect(content).to include '1996-07-01'
end

Then(/^I can see the entry number of each entry$/) do
  expect(content).to include '1.'
end

Then(/^I can see the standard text against the register entry$/) do
  expect(content).to include 'Not Dated'
end
