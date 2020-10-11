# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "../lib/custom_download_strategy"
class Bringgster < Formula
  desc ""
  homepage "https://github.com/bringg/bringgster"
  version "0.4.1"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/bringg/bringgster/releases/download/v0.4.1/bringgster_0.4.1_Darwin_x86_64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
    sha256 "7c849d806540b3f5d5cee5f2c47b535ec357aafb17723cbb094101bc562ecd16"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/bringg/bringgster/releases/download/v0.4.1/bringgster_0.4.1_Linux_x86_64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "dde2817e828c2cc66854030a0780c3d93609561729f15c7cb367080348411bd3"
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
