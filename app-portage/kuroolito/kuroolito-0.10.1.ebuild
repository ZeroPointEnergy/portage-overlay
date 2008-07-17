# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit kde

DESCRIPTION="A KDE Portage browser"
HOMEPAGE="http://kuroo.org"
SRC_URI="http://files.kuroo.org/${P}.tar.bz2"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~x86 ~amd64 ~ppc ~sparc"
IUSE="debug"
RDEPEND=">dev-python/pysqlite-2"

pkg_postinst() {
    elog "You must uncomment line 'portdbapi.auxdbmodule = cache.sqlite.database' in /etc/portage/modules"
	elog "Remember to run 'emerge --regen' to update Portage cache after each sync"
}

need-kde 3.5
