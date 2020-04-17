cask 'nuccdev' do
  version '0.0.2'
  sha256 "7cbec390f66441a9a73292a1ead68ec8f6937de2097b8772e4f5b0deeb9271b8"

  url "https://github.com/phx/homebrew-nuccdev/archive/0.0.2.tar.gz"
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
