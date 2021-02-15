# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class MojoApplicationShadow < Formula
  desc "A code generator of Spring-based REST services"
  homepage ""
  url "https://github.com/staycaffeinated/mojo-application-shadow-0.1.4.tar.gz"
  sha256 "96e158c92acae6ff6f4998f9b764dd9d1c8df46a72baefbcc329b37b1bef3451"
  license "Apache 2.0"
  # Compilation is not needed
  bottle :unneeded

  # depends_on "cmake" => :build

  def install
    # put the extracted jar into the "private" libexec folder
    libexec.install Dir['*']
    # create a shell script to launch the jar file in the "public" bin folder
    # The shell script will have the entry 'java -jar mojo-application-all.jar'
    bin.write_jar_script libexec/'mojo-application-shadow/lib/mojo-application-all.jar', 'mojo'
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
    # system "false"
  end
end
