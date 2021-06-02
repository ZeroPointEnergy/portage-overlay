# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
inherit distutils-r1

DESCRIPTION="Check PEP-8 naming conventions, plugin for flake8"
HOMEPAGE="https://github.com/PyCQA/pep8-naming"
SRC_URI="https://github.com/PyCQA/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	>=dev-python/flake8-3.9.1[${PYTHON_USEDEP}]"
#	test? ( dev-python/flake8-polyfill )"
BDEPEND=""

#TODO: Fix tests
#distutils_enable_tests setup.py
