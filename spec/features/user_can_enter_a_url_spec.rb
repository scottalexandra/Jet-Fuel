require "rails_helper"

describe "user visits the site and" do
  it "sees a place to enter a url" do
    visit root_path
    expect(page).to have_content "Paste your long url here"
  end

  it "submits a long url and clicks enter and see shortened url" do
    visit root_path
    fill_in "url[long]", with: "https://google.com"
    click_link_or_button "Shorten URL"
    within(".list-url") do
      expect(page).to have_content("https://al.x/0504")
    end
  end

  it "submits another url and see another shortened url added to the list" do
    visit root_path
    fill_in "url[long]", with: "https://google.com"
    click_link_or_button "Shorten URL"

    expect(current_path).to eq(root_path)

    fill_in "url[long]", with: "https://turing.io"
    click_link_or_button "Shorten URL"

    within(".list-url") do
      expect(page).to have_content("https://al.x/0504")
      expect(page).to have_content("https://al.x/2e89")
    end
  end
end
