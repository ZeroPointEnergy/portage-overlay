# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
inherit distutils-r1

DESCRIPTION="A minimal bitcoin library with a focus on embedded systems"
HOMEPAGE="https://github.com/diybitcoinhardware/embit"
EMBIT_GIT_REVISION="9780103f18586901adccf9dedb2bafce50e098a9"
SRC_URI="https://github.com/diybitcoinhardware/${PN}/archive/${EMBIT_GIT_REVISION}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=">=dev-libs/libsecp256k1-0.1_pre20210601"
BDEPEND=""

#distutils_enable_tests unittest

S="${WORKDIR}/${PN}-${EMBIT_GIT_REVISION}"

#TODO: Fix tests
#src_prepare() {
#	distutils-r1_src_prepare
#	# remove bundled libs
#	# https://github.com/diybitcoinhardware/embit/issues/9
#	rm -rf src/embit/util/prebuilt || die
#}
#
#python_test() {
#	"${EPYTHON}" tests/run_tests.py || die
#}
