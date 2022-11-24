class Noobaa < Formula
  desc "CLI for managing NooBaa S3 service on Kubernetes/Openshift"
  homepage "https://github.com/utkarsh-pro/noobaa-operator-copy"
  url "https://github.com/utkarsh-pro/noobaa-operator-copy.git",
      :tag      => "v5.12.7",
      :revision => "d21956ffbcd0428d1b292267bb6970437699b4a8"
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
    pos = output.index "CLI version: v5.12.7"
    raise "Version check failed" if pos.nil?

    puts "Success"
  end
end
