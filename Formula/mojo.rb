# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Mojo < Formula
  desc "A code generator for Spring-based REST services"
  homepage "https://github.com/staycaffeinated/homebrew-mojo/"
  url "https://raw.githubusercontent.com/staycaffeinated/homebrew-mojo/main/mojo-application-0.3.4.tar.gz"
  sha256 "1807502d78eec0e1d6b4cc4dce200543bbad5b04a43baf49e1a5eb126d824b63"
  license "Apache 2.0"

  def install
    # put the extracted jar into the "private" libexec folder
    # homebrew automatically unarchives the tar.gz file for us,
    # leaving us with the uber jar that gets copied to the install directory
    libexec.install "mojo-application-0.3.4-all.jar"
    # create a shell script to launch the jar file in the "public" bin folder
    # The shell script will have the entry 'java -jar mojo-application-x.y.z-all.jar'
    bin.write_jar_script libexec/"mojo-application-0.3.4-all.jar", "mojo"
  end

  test do
    # `test do` will create, run in, and delete a temporary directory.
    #
    # Run the test with `brew test mojo`. 
    #
    system "#{bin}/mojo --version"
  end
end
