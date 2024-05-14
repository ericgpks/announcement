# announcement
 土日祝日を考慮した平日に Slack にメッセージを送りたかったので AWS Lambda に関数を作成した  
 関数のコードを github に公開する

 Created a function on AWS Lambda to make an announcement on work days except weekends and holidays.  
 Publish the code on GitHub.
 
## gemfile を参照する Lambda 関数を deploy する方法
AWS の以下の公式ドキュメントを参考にする  
https://docs.aws.amazon.com/ja_jp/lambda/latest/dg/ruby-package.html#ruby-package-dependencies  
zip ファイルを生成したら、AWSマネージメントコンソール上から zip ファイルを読み込ませて使うことができるので、コンソールから作業も可能

How to deploy a function to reference Gemfile.  
I refer to the following official document.  
https://docs.aws.amazon.com/ja_jp/lambda/latest/dg/ruby-package.html#ruby-package-dependencies  
If you create a zip file, you can upload zip file on a AWS management console.  
So you can work on AWS management console.
