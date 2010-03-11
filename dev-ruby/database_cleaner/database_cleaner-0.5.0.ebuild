# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby gems

USE_RUBY="ruby18"

DESCRIPTION="Waves is an open-source Ruby framework for building Web applications."
HOMEPAGE="http://rubywaves.com"
SRC_URI="http://gems.rubyforge.org/gems/${P}.gem"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=dev-lang/ruby-1.8.4"
