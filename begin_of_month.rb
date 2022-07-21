require 'date'
require 'csv'
require 'slack-ruby-client'

def main(event:, context:)
  today = Date.today
  # today = Date.new(2022, 7, 3)
  start_of_month = Date.new(today.year, today.month, 1)
  # 月初から今日まで
  start_period = []
  start_period << start_of_month
  i = start_of_month
  while i != today
    i = i.next
    start_period << i
  end

  # 月初から今日までの平日
  weekdays = []
  start_period.each do |d|
    if d.wday.between?(1, 5)
      weekdays << d
    end
  end

  # 祝日
  holidays = []
  CSV.foreach("syukujitsu.csv") do |row |
    str_holiday_date = row[0].split('/')
    holiday_date = str_holiday_date.map { |s| s.to_i }
    holidays << Date.new(holiday_date[0], holiday_date[1], holiday_date[2])
  end


  Slack.configure do |config|
    config.token = ENV['SLACK_TOKEN']
  end

  # 平日から祝日を除く
  open_weekday = weekdays - holidays
  # その中に今日は入っている？
  # 10時
  if open_weekday.include?(today)
    client = Slack::Web::Client.new
    case open_weekday.count
    when 1
      print(today)
      client.chat_postMessage(channel: "#channel_a", text: "前月の経費申請の提出期限は月初2営業日です！！領収書の提出もよろしくお願いします！", as_user: true)
    when 2
      print(today)
      client.chat_postMessage(channel: "#channel_a", text: "前月の経費申請の提出期限は本日23:59までです！！領収書の提出も併せて忘れずに対応お願いします！", as_user: true)
    when 3
      print(today)
      client.chat_postMessage(channel: "#channel_a", text: "経費申請は本日中に確認及び承認をお願いします！", as_user: true)
    when 4
      print(today)
      client.chat_postMessage(channel: "#channel_a", text: "前月の経費申請で差し戻しされた申請がある場合は本日15時までに再申請をお願いします！", as_user: true)
    else
      print(today)
    end
  else
    print(today)
  end
end
