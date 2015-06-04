
bash "install phantomjs" do

  user 'root'
  group 'root'
  code <<-EOH

    ARCHIVE_NAME=phantomjs-1.9.8-linux-x86_64
    FILE_NAME=${ARCHIVE_NAME}.tar.bz2

    CACHE_DIR=/usr/tmp
    BIN_DIR=/usr/bin

    URL=http://mvn.quonb.org/repo/com/github/klieber/phantomjs/1.9.8/${FILE_NAME}

    DEST=${CACHE_DIR}/${FILE_NAME}

    curl $URL -o $DEST

    mkdir -p ${CACHE_DIR}/${ARCHIVE_NAME}
    tar jxf ${CACHE_DIR}/${FILE_NAME} -C $CACHE_DIR
    sudo mv ${CACHE_DIR}/${ARCHIVE_NAME}/bin/phantomjs ${BIN_DIR}/phantomjs
    EOH

end
