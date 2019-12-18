# frozen_string_literal: true

require "selenium-webdriver"
require "capybara/rspec"

Capybara.configure do |config|
  
  config.default_driver = :chrome
  config.javascript_driver = :chrome

  config.run_server = false
  config.default_selector = :css
  config.default_max_wait_time = 5
  config.ignore_hidden_elements = false
  config.save_path = Dir.pwd
  config.automatic_label_click = false
end

Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument("disable-notifications")       # Web通知やPush APIによる通知を無視する
  options.add_argument("disable-translate")           # 翻訳ツールバーを無効にする
  options.add_argument("disable-extensions")          # 拡張機能を無効にする
  options.add_argument("disable-infobars")            # インフォバーの表示を無効にする
  options.add_argument("window-size=1280,960")        # ブラウザーのサイズを指定する
  options.add_argument("no-sandbox")

  # ブラウザーを起動する
  Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      options: options,
      )
end
