EAPI=7
inherit qmake-utils eutils multilib

DESCRIPTION="Video metadata scraper"
SRC_URI="http://www.kvibes.de/releases/${PN}/${PV}/${P}.tar.gz"
HOMEPAGE="http://www.mediaelch.de/"

SLOT="0"
LICENSE="GPL-3"
KEYWORDS="amd64 x86"

DEPEND="dev-qt/qtsql:5
		dev-qt/qtscript:5
		dev-qt/qtquickcontrols:5
		dev-qt/qtxmlpatterns:5
		dev-qt/qtcore:5
		dev-qt/qtgui:5
		media-video/mediainfo
		media-libs/libzen
		media-libs/phonon
		dev-libs/quazip
		dev-qt/qtconcurrent:5
		dev-qt/qtmultimedia:5[widgets]
		dev-qt/qtscript:5"

src_configure()
{
	cd "${WORKDIR}/${P}" || die
	eqmake5 || die
}

src_install()
{
	cd "${WORKDIR}/${P}" || die
	INSTALL_ROOT=${D} einstall || die
}
