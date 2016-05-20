require 'mechanize'
require 'nkf'

namespace :scrape do
    desc '同志社の休講情報の取得'
    task :kyuko => :environment do
        agent = Mechanize.new
        url_ima_mon = 'http://duet.doshisha.ac.jp/info/KK1000.jsp?katei=1&youbi=1&kouchi=1&mobile=1'
        url_ima_tue = 'http://duet.doshisha.ac.jp/info/KK1000.jsp?katei=1&youbi=2&kouchi=1&mobile=1'
        xpath = '//html//body//table//td'
        page = agent.get(url_ima_tue)

        page.search(xpath).each do |cells|
            info = cells.text.gsub(/[[:space:]]/, ' ').gsub(/ +/, ' ').strip
            p info
        end
    end
end
