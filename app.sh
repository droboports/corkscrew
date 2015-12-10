CFLAGS="${CFLAGS:-} -ffunction-sections -fdata-sections"
LDFLAGS="${LDFLAGS:-} -Wl,--gc-sections"

### CORKSCREW ###
_build_corkscrew() {
local VERSION="2.0"
local FOLDER="corkscrew-${VERSION}"
local FILE="${FOLDER}.tar.gz"
local URL="http://agroman.net/corkscrew/${FILE}"

_download_tgz "${FILE}" "${URL}" "${FOLDER}"
pushd "target/${FOLDER}"
./configure --host="${HOST}" --prefix="${DEST}" --disable-shared
make
make install
popd
}

_build() {
  _build_corkscrew
  _package
}
