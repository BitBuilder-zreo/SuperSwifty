
Pod::Spec.new do |spec|
  
  spec.name         = "SuperSwifty"
  spec.version      = "0.0.1"
  spec.summary      = "SuperSwifty 基础封装"
  
  spec.homepage     = "https://github.com/BitBuilder-zreo/SuperSwifty"
  spec.license      = "MIT"
  spec.author             = { "Gemini" => "3101035108@qq.com" }
  spec.source       = { :git => "https://github.com/BitBuilder-zreo/SuperSwifty.git", :tag => "#{spec.version}" }
  
  spec.ios.deployment_target = "10.0"
  spec.requires_arc = true
  spec.swift_version = '4.0'
  
  
  # ----------------- 子模块 ----------------------
  spec.subspec 'Encryption' do |e|
    
    e.source_files = 'SuperSwifty/Encryption/*.swift'
    #e.frameworks = 'CommonCrypto'
    
  end
  
  
  
  
  
end
