# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-embedded/bitbake/bitbake-9999.ebuild,v 1.1 2006/02/02 22:50:17 vapier Exp $

#ESVN_REPO_URI="svn://svn.berlios.de/bitbake/trunk/bitbake"
ESVN_REPO_URI="svn://svn.berlios.de/bitbake/branches/bitbake-1.6"
inherit subversion eutils

DESCRIPTION="package management tool for OpenEmbedded"
HOMEPAGE="http://developer.berlios.de/projects/bitbake/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="dev-lang/python"

src_unpack() {
	subversion_src_unpack
	cd "${S}"
	#epatch "${FILESDIR}"/0-gentoo-paths.patch
}

src_install() {
	python setup.py install --root="${D}" || die "setup failed"
}
