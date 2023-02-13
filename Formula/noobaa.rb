class Noobaa < Formula
  desc "CLI for managing NooBaa S3 service on Kubernetes/Openshift"
  homepage "https://github.com/utkarsh-pro/noobaa-operator-copy"
  url "https://github.com/utkarsh-pro/noobaa-operator-copy.git",
      :tag      => "v5.12.11",
      :revision => "4f63627fc48b0b0b774b51f6cd760926a6d0d5bb"
  head "https://github.com/utkarsh-pro/noobaa-operator-copy.git"

  depends_on "go" => [:build, :test]

  def install
    ENV.deparallelize # avoid parallel make jobs
    ENV["GOPATH"] = buildpath
    ENV["GO111MODULE"] = "on"
    ENV["GOPROXY"] = "https://proxy.golang.org"

    src = buildpath/"src/github.com/utkarsh-pro/noobaa-operator-copy"
    src.install buildpath.children
    src.cd do
      system "go", "mod", "vendor"
      system "go", "generate"
      system "go", "build"
      bin.install "noobaa-operator" => "noobaa"
    end
  end

  test do
    output = 
    pos = output.index "CLI version: 5.12.11"
    raise "Version check failed" if pos.nil?

    puts "Success"
  end
end
