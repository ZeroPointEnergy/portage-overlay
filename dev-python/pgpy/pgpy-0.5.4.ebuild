# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
inherit distutils-r1

DESCRIPTION="Pretty Good Privacy for Python"
HOMEPAGE="https://github.com/SecurityInnovation/PGPy"

MY_PN="PGPy"
MY_P="${MY_PN}-${PV}"
SRC_URI="https://github.com/SecurityInnovation/${MY_PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	>=dev-python/cryptography-2.6[${PYTHON_USEDEP}]
	dev-python/pyasn1[${PYTHON_USEDEP}]
	>=dev-python/six-1.9.0[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-ordering[${PYTHON_USEDEP}]
		dev-python/flake8[${PYTHON_USEDEP}]
		dev-python/pep8-naming[${PYTHON_USEDEP}]
	)"
BDEPEND=""

distutils_enable_tests pytest

S="${WORKDIR}/${MY_P}"
