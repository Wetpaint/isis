require 'nokogiri'
require 'open-uri'

class TvTropes < Isis::Plugin::Base

  def respond_to_msg?(msg, speaker)
    msg.downcase == '!trope' or msg.downcase == '!tvtrope'
  end

  private

  def response_text
    page = Nokogiri.HTML(open("http://tvtropes.org/pmwiki/randomitem.php"))
    title = page.css('.pagetitle').text
    body = page.css('#wikitext').text[1..200]
    img = page.css('#wikitext img').first.attr('src')
    "#{title} #{body} #{img}"
  end
end
