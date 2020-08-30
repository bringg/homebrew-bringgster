# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "../lib/custom_download_strategy"
class Bringgster < Formula
  desc ""
  homepage "https://github.com/bringg/bringgster"
  version "0.3.1"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/bringg/bringgster/releases/download/v0.3.1/bringgster_0.3.1_Darwin_x86_64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
    sha256 "b6a89ee3fef0110d34a8f428ecbac292b39b676e6a6573dfb4f0fb3a598d2bd0"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/bringg/bringgster/releases/download/v0.3.1/bringgster_0.3.1_Linux_x86_64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "23da560de69d916e64012da84ebff49cf1063fd16bb48e9d6041c8a36b4e35e8"
    end
  end

  def install
    bin.install "bringgster"
  end

  plist_options :startup => false

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Label</key>
    <string>#{plist_name}</string>
    <key>ProgramArguments</key>
    <array>
      <string>#{bin}/bringgster</string>
      <string>minikube</string>
      <string>tunnel</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
    <key>UserName</key>
    <string>#{ENV["USER"]}</string>
  </dict>
</plist>

  EOS
  end
end
