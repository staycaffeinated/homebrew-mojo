# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Mojo < Formula
  desc "A code generator for Spring-based REST services"
  homepage "https://github.com/staycaffeinated/homebrew-mojo/"
  url "https://raw.githubusercontent.com/staycaffeinated/homebrew-mojo/main/mojo-application-0.1.7.tar.gz"
  sha256 "2e243e16425283629c6c25617a481192739d4e32da62ba320ea29e220872bd12"
  license "Apache 2.0"
  # Compilation is not needed
  bottle :unneeded

  def install
    # put the extracted jar into the "private" libexec folder
    # homebrew automatically unarchives the tar.gz file for us,
    # leaving us with the uber jar that gets copied to the install directory
    libexec.install "mojo-application-0.1.7-all.jar"
    # create a shell script to launch the jar file in the "public" bin folder
    # The shell script will have the entry 'java -jar mojo-application-x.y.z-all.jar'
    bin.write_jar_script libexec/"mojo-application-0.1.7-all.jar", "mojo"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test mojo-application-shadow`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "#{bin}/mojo --version"
  end
end
