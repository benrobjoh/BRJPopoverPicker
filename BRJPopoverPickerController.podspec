Pod::Spec.new do |s|
  s.name             = "BRJPopoverPickerController"
  s.version          = "0.1.0"
  s.summary          = "A short description of BRJPopoverPickerController."
  s.description      = <<-DESC
                       An optional longer description of BRJPopoverPickerController

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/benrobjoh/BRJPopoverPickerController"
  s.license          = 'MIT'
  s.author           = { "Ben Johnson" => "ben@benrobjoh.com" }
  s.source           = { :git => "https://github.com/benrobjoh/BRJPopoverPickerController.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  spec.ios.deployment_target = '7.0'
  s.requires_arc = true

  s.source_files = 'Classes/*.{h,m}'
end
