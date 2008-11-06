# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby gems

USE_RUBY="ruby18"

DESCRIPTION="Ruby-pg provides the module "pg", a Ruby interface to the PostgreSQL Relational Database Management System, which supersedes the old postgres module."
HOMEPAGE="http://rubyforge.org/projects/ruby-pg/"
SRC_URI="http://gems.rubyforge.org/gems/${P}.gem"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=dev-lang/ruby-1.8.4"
