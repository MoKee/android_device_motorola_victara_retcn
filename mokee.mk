$(call inherit-product, device/motorola/victara_retcn/full_victara_retcn.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/mk/config/common_full_phone.mk)

# Enhanced NFC
$(call inherit-product, vendor/mk/config/nfc_enhanced.mk)

PRODUCT_RELEASE_NAME := MOTO X (2014)
PRODUCT_NAME := mk_victara_retcn

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=victara_retcn \
    BUILD_FINGERPRINT=motorola/victara_retcn/victara:5.0.2/LXE22.92-30/30:user/release-keys \
    PRIVATE_BUILD_DESC="victara_retcn-user 5.0.2 LXE22.92-30 30 release-keys"
