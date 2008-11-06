# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby gems

USE_RUBY="ruby18"

DESCRIPTION="This is a small library intended to aid developers working with deprecated code. The idea comes from the 'D' programming language, where developers can mark certain code as deprecated, and then allow/disallow the ability to execute deprecated code."
HOMEPAGE="http://rubyforge.org/projects/deprecated/"
SRC_URI="http://gems.rubyforge.org/gems/${P}.gem"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=dev-lang/ruby-1.8.4"
