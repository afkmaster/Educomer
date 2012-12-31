When /^(?:|I )upload file "([^"]*)"$/ do |file|
  path = Rails.root + "features/support/#{file}"
  attach_file("upload_file",path)
  click_button("Submit")
end

Then /the following food by UPC should exist: "([^"]*)"$/ do |upc|
  assert Food.find_by_UPC(upc) != nil
end
