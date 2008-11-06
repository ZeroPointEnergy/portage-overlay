# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby gems

USE_RUBY="ruby18"

DESCRIPTION="Ruby/DBI develops a database independent interface for accessing databases - similar to Perl's DBI."
HOMEPAGE="http://ruby-dbi.rubyforge.org"
SRC_URI="http://gems.rubyforge.org/gems/${P}.gem"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=dev-ruby/deprecated-2.0.0 \
		>=dev-lang/ruby-1.8.4"
