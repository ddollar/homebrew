require 'formula'

class Foreman < Formula
  url 'http://assets.foreman.io/foreman/foreman-0.39.0.tgz'
  homepage 'http://ddollar.github.com/foreman'
  md5 '95b8f2716f2b16c34c430e6bc519e928'

  skip_clean %w( bin lib )

  def install
    prefix.install Dir["*"]
    bin.install prefix/"foreman"
  end

  def patches
    DATA
  end
end

__END__
diff -ur old/foreman new/foreman
--- old/foreman	2012-02-06 22:52:45.000000000 -0500
+++ new/foreman	2012-02-06 22:53:27.000000000 -0500
@@ -3,12 +3,12 @@
 require "pathname"
 bin_file = Pathname.new(__FILE__).realpath
 
-gem_dir = File.expand_path("../vendor/gems", bin_file)
+gem_dir = File.expand_path("../../vendor/gems", bin_file)
   Dir["#{gem_dir}/**/lib"].each do |libdir|
   $:.unshift libdir
 end
 
-$:.unshift File.expand_path("../lib", bin_file)
+$:.unshift File.expand_path("../../lib", bin_file)
 
 require "foreman/cli"
