# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit kde4-base

DESCRIPTION="KDE CD player"
HOMEPAGE="https://www.kde.org/applications/multimedia/kscd/"
KEYWORDS=""
IUSE="debug"

DEPEND="
	media-libs/musicbrainz:3
	media-libs/phonon[qt4]
"
RDEPEND="${DEPEND}"
