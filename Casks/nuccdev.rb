cask 'nuccdev' do
  version '0.0.3'
  sha256 "09209982020563cf5f0eafbbef0c7241a78da28df325ec7157fa7d72e3d72b6a"

  url "https://github.com/phx/homebrew-nuccdev/archive/0.0.3.tar.gz"
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
