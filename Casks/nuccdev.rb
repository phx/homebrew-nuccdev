cask 'nuccdev' do
  version '0.0.6'
  sha256 "a1a41c512d54a528c23e0650a4cb627add524308449e417f63901d1272eaaaf1"

  url "https://github.com/phx/homebrew-nuccdev/archive/0.0.6.tar.gz"
  name 'nuccdev'
  homepage "https://github.com/phx/nucc"

  depends_on cask: 'boinc'

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
                      executable: '/Library/Application Support/BOINC Data/nucc.sh',
                      args:       ['--uninstall'],
                      sudo:       true,
                    }

end
