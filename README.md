# announcement
 土日祝日を考慮した平日に Slack にメッセージを送りたかったので AWS Lambda に関数を作成した  
 関数のコードを github に公開する
 
## gemfile を参照する Lambda 関数を deploy する方法
AWS の以下の公式ドキュメントを参考にする  
https://docs.aws.amazon.com/ja_jp/lambda/latest/dg/ruby-package.html#ruby-package-dependencies  
zip ファイルを生成したら、AWSマネージメントコンソール上から zip ファイルを読み込ませて使うことができるので、コンソールから作業も可能
