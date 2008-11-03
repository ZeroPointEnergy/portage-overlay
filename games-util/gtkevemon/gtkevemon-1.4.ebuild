# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
DESCRIPTION="GtkEveMon is a skill monitoring stand-alone application for GNU/Linux systems"
SRC_URI="http://gtkevemon.battleclinic.com/releases/${P}-source.tar.gz"
HOMEPAGE="http://gtkevemon.battleclinic.com"
KEYWORDS="~x86 ~amd64 ~arm"
SLOT="0"
LICENSE="GPL-3"
IUSE=""

DEPEND=">=dev-cpp/gtkmm-2.12
	>=dev-libs/libxml2-2.6.27"
RDEPEND="${DEPEND}"

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake INSTALL_BIN="${D}"/usr/bin install || die "Install failed"
}

