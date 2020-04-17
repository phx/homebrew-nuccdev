cask 'nuccdev' do
  version '0.0.5'
  sha256 "3ef62e8f457dff28c933a43afa4cc8309f2ff47f2f50a131782ec58933b281cb"

  url "https://github.com/phx/homebrew-nuccdev/archive/0.0.5.tar.gz"
  name 'nuccdev'
  homepage "https://github.com/phx/nucc"

  depends_on cask: 'boinc'

  binary 'nucc.sh'

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
