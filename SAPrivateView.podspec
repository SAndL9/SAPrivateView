

Pod::Spec.new do |s|

  s.name         = "SAPrivateView"
  s.version      = "0.0.1"
  s.summary      = "自定义加减按钮,自定义SACollectionViewGridLayout"
  s.description  = "网仓私有库"
  s.homepage     = "https://github.com/SAndL9/SAPrivateView.git"
  s.license      = "MIT"
  s.author       = { "李磊" => "lilei@iscs.com.cn" }
  s.platform     = :ios,'8.0'
  s.source       = { :git => "https://github.com/SAndL9/SAPrivateView.git", :tag => "0.0.1" }
  s.requires_arc = true


  s.subspec 'SANumberButton' do |ss|
  ss.source_files = 'SAPrivateView/SAPrivateView/NumberButton.{h,m}'
  end


  s.subspec 'SAPlaceholderLabelTextView' do |ss|
  ss.source_files = 'SAPrivateView/SAPrivateView/SAPlaceholderLabelTextView.{h,m}'
  end


  s.subspec 'SACollectionViewGridLayout' do |ss|
  ss.source_files = 'SAPrivateView/SAPrivateView/SACollectionViewGridLayout.{h,m}'
  end




end
