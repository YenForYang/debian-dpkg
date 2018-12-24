-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (native)
Source: dpkg
Binary: dpkg, libdpkg-dev, dpkg-dev, libdpkg-perl, dselect
Architecture: any all
Version: 1.19.2
Origin: debian
Maintainer: Dpkg Developers <debian-dpkg@lists.debian.org>
Uploaders: Guillem Jover <guillem@debian.org>
Homepage: https://wiki.debian.org/Teams/Dpkg
Standards-Version: 4.1.1
Vcs-Browser: https://git.dpkg.org/cgit/dpkg/dpkg.git
Vcs-Git: https://git.dpkg.org/git/dpkg/dpkg.git
Build-Depends: debhelper (>= 10), pkg-config, gettext (>= 0.19.7), po4a (>= 0.43), zlib1g-dev, libbz2-dev, liblzma-dev, libselinux1-dev [linux-any], libncurses-dev (>= 6.1+20180210) | libncursesw5-dev, bzip2 <!nocheck>, xz-utils <!nocheck>
Package-List:
 dpkg deb admin required arch=any essential=yes
 dpkg-dev deb utils optional arch=all
 dselect deb admin optional arch=any
 libdpkg-dev deb libdevel optional arch=any
 libdpkg-perl deb perl optional arch=all
Checksums-Sha1:
 927d34f3828c248db6d1a91aaa7a9a19b236a2c8 4607868 dpkg_1.19.2.tar.xz
Checksums-Sha256:
 f8f2ae2cf8065b81239db960b3794099ec607c94a125cec61c986f68f9861b71 4607868 dpkg_1.19.2.tar.xz
Files:
 a9bbf77a79e4f681c9aefa5cdaffeffb 4607868 dpkg_1.19.2.tar.xz

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEETz509DYFDBD1aWV0uXK/PqSuV6MFAlu7M/AACgkQuXK/PqSu
V6Og0hAAknwAf0GMRNj43bn/ZVyE2uVX5ziscYQ1lHQ581WyjVEb18vd/vOm2LX6
sCuJrCMyhgcdV7JAGhoE8bUre1b8Bcb5gW14I1q5KNC27xkteSPx4LO1fLAVY6Wc
NCDzasVNp0U1HWR3bSx0ihxFlmr7LfvisVv63Cg53AKHqIHy1KgyrjMYXwpJh8oh
IQHfEyGVz90Q1Qe8PBp+WgSBfUeNlP4UvcnKbj+aG1g/a9xiX8iLuDTayRSNbYbz
KoyFd3acKe304uireQ5fjRPY6I9VQRjdXLMMaamhKz98VGr08RpU196ARTvGGdsj
3EPhEk4gR+ONRVvAqL/vYw3v7jqjs3+TJSCiBjPNaF5mEsojOnoC8XXAqUz1G2oY
ogX+KVV0nKISqRfDUUoWHtkKdlbGalh2VYqbAYQ3wvxdAhh6+p+Jd8mvVO5MXV+v
4pXADZXsYV+rgtTt4ysPF9pGsFhd7q4pCKkxXM3nxaEtbB+MmIzNXkZs3hU8gljl
BAD20VdV9WE1p6vFO2jng8gjcdlJZu2OpFncUlE1SVBsSEudQLr3FgnCRmDtYjqF
Z4h1DCMfnRfYUHR0ALqGkXXEbdm5zrgkswF6aJDxup6YaCrVA6msMyfsXzQfX5Xz
rVbyKPjr5In4w46HCfo1WMJzQhjp+fHSSQE9JygDX/ynQVgnkc8=
=hP5X
-----END PGP SIGNATURE-----
