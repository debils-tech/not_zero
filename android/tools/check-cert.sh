# Run this file like this:
# sh android/tools/check-cert.sh app-arm64-v8a-release.apk

BUILD_BASE=build/releases
FINGERPRINT="SHA256: 38:47:CF:E3:A5:2D:FD:DE:BC:FA:51:AF:3E:D3:22:A4:19:6E:A7:6B:3D:65:9E:10:01:B9:22:ED:0A:17:FD:8A"
FILE="$BUILD_BASE/$1"

FILE_CERT=$(keytool -printcert -jarfile "$FILE")

if echo $FILE_CERT | grep -q "$FINGERPRINT"; then
    printf "\033[92m ✔️ \"$1\" certificate fingerprint valid\033[0m\n"
else
    printf "\033[93m ⚠️ \"$1\" hasn't got trusted certificate fingerprint\033[0m\n"
fi
