# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Installs Ruby, JRuby, Rubinius, MagLev or MRuby"
HOMEPAGE="https://github.com/postmodern/ruby-install"
SRC_URI="https://github.com/postmodern/${PN}/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
    echo "Skip compile step"
}

src_install() {
	emake PREFIX=/usr DESTDIR="${D}" install
}
