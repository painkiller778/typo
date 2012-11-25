Given /the following articles exist/ do |articles|

	articles.hashes.each do |article|
    a = Article.new
    a.title = article[:title]
    a.body = article[:body]
		a.save!
	end
end

Given /the following comments exist/ do |comments|
  comments.hashes.each do |comment|
    c = Comment.new
    c.title = comment[:title]
    c.body = comment[:body]
    c.author = comment[:author]

    a = Article.find_by_title(comment[:article])

    a.comments << c

    a.save!
    
  end
end


When /^I fill article_id with "(.*)" id$/ do |title|
  fill_in("article_id", :with => Article.find_by_title(title).id)
end

When /^I submit the merge form$/ do
  click_button "Merge Articles"
end

Then /^"(.*)" body should contain "(.*)"$/ do |title, text|
  Article.find_by_title(title).body.index(text).should_not == nil
end

Then /^"(.*)" should have (\d+) comments$/ do |title, number|
  Article.find_by_title(title).comments.length.should == number.to_i
end

Then /^"(.*)" should not exist$/ do |title|
  Article.find_by_title(title).should == nil
end
