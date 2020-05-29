require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'I can search for a book' do
    it "gives me search results" do
      visit '/'
      fill_in('title', with: 'Normal People')
      click_on 'commit'
      expect(current_path).to eq("/search")
      within(find_css(".book_info")) do
        expect(find_css(".book_title")).to have_content("Normal People")
        expect(find_css(".book_author")).to have_content("Sally Rooney")
        expect(find_css(".book_publisher")).to have_content("Faber & Faber, Hogarth, Random House Large Print, Knopf Canada")
      end
      within(find_css(".reviews")) do
        expect(find_css(".review_count")).to have_content("2")
        expect(find_css(".review").count).to eq 2
        expect(find_css(".review").first).to include("Rooney's second novel tracks two gifted but troubled teenagers across four years of friendship and occasional romance.")
        expect(page).to have_content("Review Publication Date: 2019-04-08")
        expect(find_css(".review").second).to include("Like \"Conversations With Friends,\" \"Normal People\" also traces a young romance in Ireland.")
        expect(page).to have_content("Review Publication Date: 2019-04-15")
      end
    end
  end
end
