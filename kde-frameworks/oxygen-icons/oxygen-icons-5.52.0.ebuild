# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

KDE_AUTODEPS="false"
KDE_DEBUG="false"
KDE_QTHELP="false"
KDE_TEST="true"
KMNAME="oxygen-icons5"
inherit kde5

DESCRIPTION="Oxygen SVG icon theme"
LICENSE="LGPL-3"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~x86"
IUSE=""

DEPEND="
	$(add_frameworks_dep extra-cmake-modules)
	$(add_qt_dep qtcore)
	test? (
		$(add_qt_dep qttest)
		app-misc/fdupes
	)
"
RDEPEND="
	!kde-apps/kdepim-icons:4
	!kde-frameworks/oxygen-icons:4
"