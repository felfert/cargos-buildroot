################################################################################
#
# acpid
#
################################################################################

ACPID_VERSION = 2.0.22
ACPID_SOURCE = acpid-$(ACPID_VERSION).tar.xz
ACPID_SITE = http://downloads.sourceforge.net/project/acpid2
ACPID_LICENSE = GPLv2+
ACPID_LICENSE_FILES = COPYING

define ACPID_SET_EVENTS
	mkdir -p $(TARGET_DIR)/etc/acpi/events
	printf "event=button[ /]power\naction=/sbin/poweroff\n" \
		>$(TARGET_DIR)/etc/acpi/events/powerbtn
endef

ACPID_POST_INSTALL_TARGET_HOOKS += ACPID_SET_EVENTS

$(eval $(autotools-package))
