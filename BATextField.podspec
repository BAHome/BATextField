Pod::Spec.new do |s|
    s.name         = 'BATextField'
    s.version      = '1.0.1'
s.summary      = 'UITextField 的封装，用分类封装 UITextField，代码无任何侵入更改，用 block 方式实现所需代理回调，更加方便，代码更简洁，可以限制最大输入长度、历史记录等功能'
    s.homepage     = 'https://github.com/BAHome/BATextField'
    s.license      = 'MIT'
    s.authors      = { 'boai' => 'sunboyan@outlook.com' }
    s.platform     = :ios, '7.0'
    s.source       = { :git => 'https://github.com/BAHome/BATextField.git', :tag => s.version.to_s }
    s.source_files = 'BATextField/BATextField/*.{h,m}'
    s.requires_arc = true
end
