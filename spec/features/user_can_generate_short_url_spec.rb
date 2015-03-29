require "rails_helper"

describe "user visits the site and" do
  it "sees a place to enter a url" do
    visit root_path
    expect(page).to have_content "Paste your long url here"
  end

  it "submits a long url and clicks enter and see shortened url" do
    visit root_path
    fill_in "url[long]", with: "http://google.com"
    click_link_or_button "Shorten URL"
    within(".list-url-by-created-at") do
      expect(page).to have_content("http://al.x/aa22")
    end
  end

  it "submits another url and see another shortened url added to the list" do
    visit root_path
    fill_in "url[long]", with: "http://google.com"
    click_link_or_button "Shorten URL"

    expect(current_path).to eq(root_path)

    fill_in "url[long]", with: "http://turing.io"
    click_link_or_button "Shorten URL"
    within(".list-url-by-created-at") do
      expect(page).to have_content("http://al.x/aa22")
      expect(page).to have_content("http://al.x/93b9")
    end
  end


  it "generates a short url that is redirected to long url" do
    visit root_path
    fill_in "url[long]", with: "http://google.com"
    click_link_or_button "Shorten URL"

    within(".list-url-by-created-at") do
      expect(page).to have_link "http://al.x/aa22"
    end
  end

  it "see urls sorted by popularity" do
    create_and_save_urls
    visit root_path
    within(".list-url-by-created-at") do
      click_link "http://al.x/93b9"
    end
    visit root_path
    within(".list-url-by-pop") do
      expect(page).to have_content("http://al.x/93b9 less than a minute ago 1")
      expect(page).to have_content("http://al.x/aa22 less than a minute ago 0")
    end
  end

  def create_and_save_urls
    @url1 = Url.new(long: "http://google.com")
    @url2 = Url.new(long: "http://turing.io")
    @url1.create_short_url
    @url2.create_short_url
    @url1.save
    @url2.save
  end

end
