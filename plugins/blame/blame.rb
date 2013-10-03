require 'nokogiri'
require 'open-uri'

class Blame < Isis::Plugin::Base

  TRIGGERS = %w{!blame !disapprove !jerkins !honeybadger !rage}

  LIST = {
    blame: YAML.load(File.read(File.join ROOT_FOLDER, 'plugins', 'blame', 'blame.yml')),
    disapprove: YAML.load(File.read(File.join ROOT_FOLDER, 'plugins', 'blame', 'disapprove.yml')),
    jerkins: YAML.load(File.read(File.join ROOT_FOLDER, 'plugins', 'blame', 'jerkins.yml')),
    honeybadger: YAML.load(File.read(File.join ROOT_FOLDER, 'plugins', 'blame', 'honeybadger.yml')),
    rage: YAML.load(File.read(File.join ROOT_FOLDER, 'plugins', 'blame', 'rage.yml'))
    }

  def respond_to_msg?(msg, speaker)
    if TRIGGERS.include? msg.downcase
      @list = msg.downcase[1..-1].to_sym
      return true
    else
      return false
    end
  end

  private

  def response_html
    "<b>#{LIST[@list].sample}</b>"
  end

  def response_text
    LIST[@list].sample
  end
end
