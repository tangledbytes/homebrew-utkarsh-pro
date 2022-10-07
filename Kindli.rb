# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Kindli < Formula
  desc ""
  homepage "https://github.com/utkarsh-pro/kindli"
  version "0.2.1"

  depends_on "git"
  depends_on "make"
  depends_on "automake"
  depends_on "lima"
  depends_on "autoconf"
  depends_on :macos

  on_macos do
    url "https://github.com/utkarsh-pro/kindli/releases/download/v0.2.1/kindli_0.2.1_Darwin_all.tar.gz"
    sha256 "178105946b269fba4949b8df954fac27cfc8dd6a1296ed2bfa0e3043fb2e68a2"

    def install
      bin.install "kindli"
    end
  end
end
