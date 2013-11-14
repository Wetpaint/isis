require 'nokogiri'
require 'open-uri'

class Tumblr < Isis::Plugin::Base

  TRIGGERS = %w(!tumblr)

  def respond_to_msg?(msg, speaker)
    TRIGGERS.include? msg.split(' ')[0].downcase
    @domain = msg.split(' ')[1]
  end

  private

  def response_text
    page = Nokogiri.HTML(open("http://#{@domain}.tumblr.com/random"))
    title = page.title
    img = page.css('#content img')
    img = img[0] if img.is_a? Array
    img = img.attr('src').value
    "#{title} #{img}"
  end
end
