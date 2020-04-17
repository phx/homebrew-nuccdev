cask 'nuccdev' do
  version '0.0.4'
  sha256 "5bacc9688990ec360ec6bd07795b181cfdd40cca5084ebe172dca78f9cf0b4e9"

  url "https://github.com/phx/homebrew-nuccdev/archive/0.0.4.tar.gz"
  name 'nuccdev'
  homepage "https://github.com/phx/nucc"

  depends_on cask: 'boinc'

  binary: 'nucc.sh'

  installer script: {
                      executable: './nucc.sh',
                      args:       ['--install'],
                      sudo:       false,
                    }

  uninstall quit: [
                    'edu.berkeley.boinc',
                    'edu.berkeley.boinc-sshelper'
                  ]

  uninstall script: {
                      executable: 'nucc.sh',
                      args:       ['--uninstall'],
                      sudo:       true,
                    }
end
