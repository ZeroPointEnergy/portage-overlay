# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils mercurial

DESCRIPTION="GtkEveMon is a skill monitoring stand-alone application for GNU/Linux systems"
SRC_URI=""
EHG_REPO_URI="https://bitbucket.org/BattleClinic/gtkevemon/${PN%-svn}"
EHG_PROJECT="${PN%-svn}"
HOMEPAGE="http://gtkevemon.battleclinic.com"
KEYWORDS="~x86 ~amd64"
SLOT="0"
LICENSE="GPL-3"
IUSE=""

DEPEND=">=dev-cpp/gtkmm-2.12
        >=dev-libs/libxml2-2.6.27
		dev-libs/openssl"
RDEPEND="${DEPEND}"


src_compile() {
	cd gtkevemon

	emake || die
}


src_install() {
	cd gtkevemon
	exeinto /usr/bin
	newexe src/${PN%-svn} ${PN%-svn}
	newicon icon/${PN%-svn}.png ${PN%-svn}.png
	newmenu icon/${PN%-svn}.desktop ${PN%-svn}.desktop
}

