# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby gems

USE_RUBY="ruby18"

DESCRIPTION="A simple issue tracker designed to integrate well with distributed
version control systems like git and darcs. State is saved to a YAML file kept
under version control, allowing issues to be closed/added/modified as part of a
commit"
HOMEPAGE="http://ditz.rubyforge.org/"
SRC_URI="http://gems.rubyforge.org/gems/${P}.gem"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=dev-ruby/trollop-1.13 \
		>=dev-lang/ruby-1.8.4"
