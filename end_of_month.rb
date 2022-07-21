class Main
  require 'csv'
  # 曜日をチェック
  def weekend?(end_date)
    if end_date.wday == 0 || end_date.wday == 6
      true
    else
      false
    end
  end

  # 祝日かどうか
  def holiday?(a_date)
    holidays = []
    CSV.foreach("syukujitsu.csv") do |row |
      str_holiday_date = row[0].split('/')
      holiday_date = str_holiday_date.map { |s| s.to_i }
      holidays << Date.new(holiday_date[0], holiday_date[1], holiday_date[2])
    end
    if holidays.include?(a_date)
      true
    else
      false
    end
  end
end


require 'date'
require 'net/http'
require 'uri'
require 'slack-ruby-client'

def main(event:, context:)
  Slack.configure do |config|
    config.token = ENV['SLACK_TOKEN']
  end

  today = Date.today
  end_date = Date.new(today.year, today.month, -1)
  main = Main.new
  # 平日かつ祝日でない月末の日
  while main.weekend?(end_date)  ||  main.holiday?(end_date) do
    end_date = end_date.prev_day
  end

  if today == end_date
    client = Slack::Web::Client.new
    print(today)
    client.chat_postMessage(channel: "#channel_b", text: "今日は今月最終営業日です！経費申請の提出期限は月初2営業日ですので早めの対応をお願いします！！", as_user: true)
  else
    print(today)
  end
end
