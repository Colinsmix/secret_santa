module PoltergeistHelper
  def save_and_open_poltergeist
    dir = "#{Rails.root}/tmp/capybara"
    file = "#{dir}/#{Time.now.strftime('%Y-%m-%d-%H-%M-%S')}.png"
    save_screenshot file
    wait_until { File.exists?(file) }
    system "open #{file}"
  end
end
