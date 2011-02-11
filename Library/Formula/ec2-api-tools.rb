require 'formula'

# This formula serves as the base class for several very similar
# formulae for Amazon Web Services related tools.

class AmazonWebServicesFormula < Formula
  # Use this method to peform a standard install for Java-based tools,
  # keeping the .jars out of HOMEBREW_PREFIX/lib
  def standard_install
    rm Dir['bin/*.cmd'] # Remove Windows versions
    prefix.install "bin"
    # Put the .jars in prefix/jars/lib, which isn't linked to the Cellar
    # This will prevent conflicts with other versions of these jars.
    (lib+'ec2-api-jars').install 'lib'
    (lib+'ec2-api-jars/bin').make_symlink '../bin'
  end

  # Use this method to generate standard caveats.
  def standard_instructions var_name, var_value=(HOMEBREW_PREFIX+'lib/ec2-api-jars')
    <<-EOS.undent
      Before you can use these tools you must export some variables to your $SHELL
      and download your X.509 certificate and private key from Amazon Web Services.

      Your certificate and private key are available at:
      http://aws-portal.amazon.com/gp/aws/developer/account/index.html?action=access-key

      Download two ".pem" files, one starting with `pk-`, and one starting with `cert-`.
      You need to put both into a folder in your home directory, `~/.ec2`.

      To export the needed variables, add them to your dotfiles.
       * On Bash, add them to `~/.bash_profile`.
       * On Zsh, add them to `~/.zprofile` instead.

      export JAVA_HOME="$(/usr/libexec/java_home)"
      export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
      export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"
      export #{var_name}="#{var_value}"
    EOS
  end
end

class Ec2ApiTools < AmazonWebServicesFormula
  homepage 'http://aws.amazon.com/developertools/351'
  url 'http://ec2-downloads.s3.amazonaws.com/ec2-api-tools-1.6.6.0.zip'
  sha1 'e2461caf2b95e97e991f3d22b63516ed46a270f0'

  def install
    standard_install
  end

  def caveats
    standard_instructions "EC2_HOME"
  end
end
