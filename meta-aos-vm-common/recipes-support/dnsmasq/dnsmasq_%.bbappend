FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI += " \
    file://0001-network-Add-SO_REUSEPORT-to-allow-tcp-listening.patch;patch=1 \
"

# disable dnsmasq daemon and install binary only

do_install () {
	oe_runmake "PREFIX=${D}${prefix}" \
               "BINDIR=${D}${bindir}" \
               "MANDIR=${D}${mandir}" \
               install
}

SYSTEMD_SERVICE:${PN} = ""
SYSTEMD_AUTO_ENABLE ?= "disable"
