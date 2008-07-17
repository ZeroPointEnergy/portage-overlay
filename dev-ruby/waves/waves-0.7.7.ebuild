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
RDEPEND=">=dev-ruby/rack-0.2.0 \
		>=dev-ruby/markaby-0.5 \
		>=dev-ruby/erubis-2.6.2 \
		>=dev-ruby/redcloth-3.0.4 \
		>=dev-ruby/sequel-2.1.0 \
		>=dev-ruby/extensions-0.6.0 \
		>=dev-ruby/live_console-0.1.0 \
		>=dev-ruby/choice-0.1.2 \
		=dev-ruby/autocode-1.0.0 \
		>=dev-ruby/haml-2.0.0 \
		>=dev-ruby/rakegen-0.6.4 \
		>=dev-ruby/highline-1.4.0 \
		>=dev-lang/ruby-1.8.4"
