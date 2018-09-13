# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Another Crystal web framework"
HOMEPAGE="https://luckyframework.org"
SRC_URI="https://github.com/luckyframework/lucky_cli/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-db/postgresql:10
	dev-libs/openssl:0
	=dev-lang/crystal-0.26*
	>=dev-util/shards-0.8.1"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	shards install
}

src_compile() {
	crystal build src/lucky.cr --release --no-debug
}

src_install() {
	dobin lucky
	dodoc README.md
}
