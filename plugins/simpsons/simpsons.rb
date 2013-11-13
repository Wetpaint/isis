require 'nokogiri'
require 'open-uri'

class Simpsons < Isis::Plugin::Base

  TRIGGERS = %w(!simpsons)

  def respond_to_msg?(msg, speaker)
    TRIGGERS.include? msg.downcase
  end

  private

  def response_text
    page = Nokogiri.HTML(open('http://http://simpsonsgifs.tumblr.com/random'))
    title = page.css('.post .copy').text
    img = page.css('.post .media img').attr('src').value
    "#{title} #{img}"
  end
end
