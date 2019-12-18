require 'spec_helper.rb'

describe 'Yahoo! JAPAN' do
  
  before(:each) do
    visit 'https://www.yahoo.co.jp/'
  end
  
  it 'タイトルが`Yahoo! JAPAN`であること' do
    expect(page).to have_title('Yahoo! JAPAN')
  end
  
  context '検索ワードに`ニャホニャホタマクロー`を入力した時' do
    it '検索結果ページの入力フィールドに検索ワードが入力されていること' do
      first("input[type='search']").set("ニャホニャホタマクロー")
      click_on('検索')
      sleep(4)
      click_on('ニャホ・ニャホ＝タマクロー - Wikipedia')
      sleep(4)
    end
  end
end
