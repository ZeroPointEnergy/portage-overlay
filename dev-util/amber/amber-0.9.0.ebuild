# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="A Crystal web framework"
HOMEPAGE="https://amberframework.org/"
SRC_URI="https://github.com/amberframework/amber/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

# libreadline-dev libsqlite3-dev libpq-dev libmysqlclient-dev libssl-dev libyaml-dev
DEPEND="
	sys-libs/readline:0/7
	dev-db/sqlite
	dev-db/postgresql:10
	virtual/libmysqlclient
	dev-libs/openssl:0
	dev-libs/libyaml
	=dev-lang/crystal-0.26*
	>=dev-util/shards-0.8.1"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	shards install
}

src_install() {
	dobin bin/${PN}
	dodoc README.md
}