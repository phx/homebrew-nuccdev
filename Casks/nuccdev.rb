cask 'nuccdev' do
  version '0.0.1'
  sha256 "ba5eb07f4a3bbf2fe141016f5374b8d298d30238862540e4f0868656f6930525"

  url "https://github.com/phx/homebrew-nuccdev/archive/0.0.1.tar.gz"
  name 'nuccdev'
  homepage "https://github.com/phx/nucc"

  depends_on cask: 'boinc'

  installer script: {
                      executable: './quickstart.sh',
                      args:       ['none'],
                      sudo:       false,
                    }

  uninstall quit: [
                    'edu.berkeley.boinc',
                    'edu.berkeley.boinc-sshelper'
                  ]
end
