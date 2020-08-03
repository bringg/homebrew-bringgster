# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "../lib/custom_download_strategy"
class Bringgster < Formula
  desc ""
  homepage "https://github.com/bringg/bringgster"
  version "0.2.6"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/bringg/bringgster/releases/download/v0.2.6/bringgster_0.2.6_Darwin_x86_64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
    sha256 "7011fb8926050d8145c40677051dc66e9c7a2a88efc5d24c8e09f54c88607609"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/bringg/bringgster/releases/download/v0.2.6/bringgster_0.2.6_Linux_x86_64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "7785744d019bae05b20b286ab92e814f968b410dfa28c9265aee5fee6c8687af"
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
      <string>#{opt_sbin}/bringgster</string>
      <string>minikube</string>
      <string>tunnel</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
  </dict>
</plist>

  EOS
  end
end
