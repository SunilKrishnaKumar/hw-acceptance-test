
Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create movie
  end
end

Then /(.*) seed movies should exist/ do | n_seeds |
  # puts Movie.title
  Movie.count.should be n_seeds.to_i
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(e1) < page.body.index(e2))
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(', ').each do |rating|
    step %{I #{uncheck.nil? ? '' : 'un'}check "ratings_#{rating}"}
  end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  Movie.all.each do |movie|
    step %{I should see "#{movie.title}"}
  end
end

Then /^the director of "(.+)" should be "(.+)"/ do |movie, director|
  # movie = Movie.find_by(title: movie)
  # puts(movie.director)
  # # step %{I should see "#{movie.director}"}
  # visit movie_path(movie)
  # puts(movie_path(movie))
  # puts(/Director:\s#{director}/)
  # expect(page.body).to match(/Director:\s#{director}/)
  if page.respond_to? :should
    page.should have_content(movie)
    page.should have_content(director)
  else
    assert page.has_content?(movie)
    assert page.has_content?(director)
  end
end

