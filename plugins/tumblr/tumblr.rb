require 'nokogiri'
require 'open-uri'

class Tumblr < Isis::Plugin::Base

  TRIGGERS = %w(!tumblr)

  def respond_to_msg?(msg, speaker)
    if TRIGGERS.include? msg.split(' ')[0].downcase
      @domain = msg.split(' ')[1]
      return true
    else
      return false
    end
  end

  private

  def response_html
    request = open("http://#{@domain}.tumblr.com/random")
    page = Nokogiri.HTML(request)
    img = page.css('#content img')
    img = img[0] if img.is_a? Array
    img = img.attr('src').value
    "<a href='#{request.base_uri}'>#{request.base_uri}</a><br /><img width='300' height='300' src='#{img}'/>"
  end

  def response_text
    page = Nokogiri.HTML(open("http://#{@domain}.tumblr.com/random"))
    title = page.title
    img = page.css('#content img')
    img = img[0] if img.is_a? Array
    img = img.attr('src').value
    "#{title} #{img}"
  end
end
