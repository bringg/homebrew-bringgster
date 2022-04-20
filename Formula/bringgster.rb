# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "../lib/custom_download_strategy"
class Bringgster < Formula
  desc ""
  homepage "https://github.com/bringg/bringgster"
  version "0.4.8"

  on_macos do
    url "https://github.com/bringg/bringgster/releases/download/v0.4.8/bringgster_0.4.8_Darwin_x86_64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
    sha256 "4231021d142e18d8e0fc9e5139ac4cf36c76a1fb490e29c6d873ef6c55552fcf"

    def install
      bin.install "bringgster"
    end

    if Hardware::CPU.arm?
      def caveats
        <<~EOS
          The darwin_arm64 architecture is not supported for the Bringgster
          formula at this time. The darwin_amd64 binary may work in compatibility
          mode, but it might not be fully supported.
        EOS
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bringg/bringgster/releases/download/v0.4.8/bringgster_0.4.8_Linux_x86_64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "f8a1be807829b7732c75b98a212ee4f52f25619032b9c9c82636e49b86025f74"

      def install
        bin.install "bringgster"
      end
    end
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
