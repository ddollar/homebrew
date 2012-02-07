require 'formula'

class Heroku < Formula
  url 'http://assets.heroku.com/heroku-client/heroku-client-2.19.2.tgz'
  homepage 'http://github.com/heroku/heroku'
  md5 '621993b93e0ad03cdd36337d4a1a3f29'

  skip_clean %w( bin lib )

  def install
    prefix.mkpath
    bin.mkpath
    prefix.install Dir["*"]
    bin.install prefix/"heroku"
  end

  def patches
    DATA
  end
end

__END__
diff -ur old/heroku new/heroku
--- old/heroku	2012-02-06 22:50:01.000000000 -0500
+++ new/heroku	2012-02-06 22:50:39.000000000 -0500
@@ -11,13 +11,13 @@
 bin_file = Pathname.new(__FILE__).realpath

 # add locally vendored gems to libpath
-gem_dir = File.expand_path("../vendor/gems", bin_file)
+gem_dir = File.expand_path("../../vendor/gems", bin_file)
 Dir["#{gem_dir}/**/lib"].each do |libdir|
   $:.unshift libdir
 end

 # add self to libpath
-$:.unshift File.expand_path("../lib", bin_file)
+$:.unshift File.expand_path("../../lib", bin_file)

 # inject any code in ~/.heroku/client over top
 require "heroku/updater"
