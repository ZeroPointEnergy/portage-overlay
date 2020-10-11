# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7,8} )
DISTUTILS_SINGLE_IMPL=1

inherit distutils-r1

DESCRIPTION="User-friendly GUI around Bitcoin Core"
HOMEPAGE="https://github.com/cryptoadvance/specter-desktop"
SRC_URI="https://github.com/cryptoadvance/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

BDEPEND=""
RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/bitbox02-4.1.0[${PYTHON_USEDEP}]
		dev-python/certifi[${PYTHON_USEDEP}]
		>=dev-python/chardet-3.0.4[${PYTHON_USEDEP}]
		>=dev-python/click-7.0.0[${PYTHON_USEDEP}]
		>=dev-python/daemonize-2.5.0[${PYTHON_USEDEP}]
		>=dev-python/flask-1.1.2[${PYTHON_USEDEP}]
		>=dev-python/flask-cors-3.0.8[${PYTHON_USEDEP}]
		>=dev-python/flask-login-0.5.0[${PYTHON_USEDEP}]
		>=dev-python/hwi-1.1.2[${PYTHON_USEDEP}]
		>=dev-python/importlib_metadata-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/importlib_resources-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/PyQt5-5.14.2[${PYTHON_USEDEP}]
		>=dev-python/PyQtWebEngine-5.14.0[${PYTHON_USEDEP}]
		>=dev-python/pyserial-3.4[${PYTHON_USEDEP}]
		>=dev-python/PySocks-1.7.1[${PYTHON_USEDEP}]
		>=dev-python/python-dotenv-0.13.0[${PYTHON_USEDEP}]
		>=dev-python/requests-2.23.0[${PYTHON_USEDEP}]
		>=dev-python/six-1.12.0[${PYTHON_USEDEP}]
		>=net-libs/stem-1.8.0[${PYTHON_USEDEP}]
	')"

PATCHES=(
  "${FILESDIR}/fix-pip-installed-version.patch"
  "${FILESDIR}/load-tray-image-from-static-resource-dir.patch"
)

src_prepare() {
	default

	# Add a shebang to the scripts
	sed '1 s/^/#!\/usr\/bin\/python3\n/' -i  pyinstaller/specterd.py || die "sed for specterd.py failed"
	sed '1 s/^/#!\/usr\/bin\/python3\n/' -i  pyinstaller/hwibridge.py || die "sed for hwibridge.py failed"
	sed '1 s/^/#!\/usr\/bin\/python3\n/' -i  pyinstaller/specter_desktop.py || die "sed for hwibridge.py failed"

	# Replace version string in setup.py
	sed "s/vx\.y\.z-get-replaced-by-release-script/${PV}/" -i setup.py || die "sed for setup.py failed"
}

python_install() {
	python_newscript pyinstaller/specterd.py specterd
	python_newscript pyinstaller/hwibridge.py hwibridge
	python_newscript pyinstaller/specter_desktop.py specter_desktop

	distutils-r1_python_install
}
