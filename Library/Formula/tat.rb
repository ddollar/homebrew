require 'formula'

class Tat < Formula
  url 'https://github.com/ddollar/tat/tarball/15c8a30ae4aee265f0d59f0b5766ca8618481db5'
  version '15c8a30ae4aee265f0d59f0b5766ca8618481db5'
  homepage 'https://github.com/ryandotsmith/tat'
  head 'https://github.com/ddollar/tat.git'
  md5 'cf2ee8ada24df24975f3bd804db8bc56'

  def install
    system "make", "install", "prefix=#{prefix}"
  end
end
