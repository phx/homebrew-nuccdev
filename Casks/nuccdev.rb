cask 'nuccdev' do
  version :latest
  sha256 :no_check

  url "https://github.com/phx/homebrew-nucc/archive/0.1.0.tar.gz"
  name 'nuccdev'
  homepage "https://github.com/phx/nucc"

  depends_on cask: 'boinc'

  installer script: {
                      executable: './quickstart.sh',
                      args:       ['none'],
                      sudo:       false,
                    }

  uninstall quit: {
                    'edu.berkeley.boinc',
                    'edu.berkeley.boinc-sshelper'
                  }
end
