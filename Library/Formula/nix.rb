require 'formula'

class Nix < Formula
  url 'http://hydra.nixos.org/build/565033/download/5/nix-0.16.tar.gz'
  homepage 'http://nixos.org/nix/'
  md5 'f214607a8ab8d1e37acfe6d5023feec4'

  skip_clean %w( bin lib )

  def install
    system "./configure", "--prefix=#{prefix}",
      "--with-bzip2=/usr", "--localstatedir=#{var}/nix/state",
      "--with-store-dir=#{var}/nix/store"
    system "make install"
  end
end
