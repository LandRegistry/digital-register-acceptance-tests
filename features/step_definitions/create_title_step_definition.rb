Given(/^I have a title$/) do
  @title_hash = insert_title_with_owners
end

Given(/^I do not have a title$/) do
  @title_hash = {
    title_number: 'BAD_TITLE'
  }
  # Do not create the title in the database
end

Given(/^I have a title with an owner$/) do
  @title_hash = insert_title_with_owners
end

Given(/^I have a title with multiple owners$/) do
  @title_hash = insert_title_with_owners(2)
end

Given(/^I have a title with a non private individual owner$/) do
  @title_hash = insert_title_non_private_individual_owner
end

Given(/^I have a title with a charity with trustees that are private individuals$/) do
  @title_hash = insert_title_charity_private_individual_owner
end

Given(/^I have a title with a charity with trustees that are non private individual owners$/) do
  @title_hash = insert_title_charity_non_private_individual_owner
end

Given(/^I have a title with a private individual owner$/) do
  @title_hash = insert_title_private_individual_owner
end

Given(/^I have a title with multiple index polygons$/) do
  @title_hash = insert_title_with_multiple_index_polygons
end

Given(/^I have a title with private and non private Individual owners$/) do
  @title_hash = insert_title_with_private_and_non_private_owners
end
