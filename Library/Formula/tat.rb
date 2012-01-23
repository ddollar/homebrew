require 'formula'

class Tat < Formula
  url 'https://github.com/ryandotsmith/tat/tarball/e6d8043a24f786c885d1df9954d21db98b39e530'
  version 'e6d8043a24f786c885d1df9954d21db98b39e530'
  homepage 'https://github.com/ryandotsmith/tat'
  head 'https://github.com/ryandotsmith/tat.git'
  md5 'f70aa226d1cb033a42483e99fcf42f1b'

  def install
    cp "tat.sh", prefix+"tat.sh"
    system "chmod u+x #{prefix+"tat.sh"}"
    bin.mkpath
    ln_s prefix+"tat.sh", bin+"tat"
  end
end
