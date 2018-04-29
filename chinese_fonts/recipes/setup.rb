
bash "grab chinese fonts" do

  user 'root'
  group 'root'
  code <<-EOH
    URL=https://s3.ap-northeast-1.amazonaws.com/chinese-fonts/fonts.zip

    CACHE_DIR=/usr/tmp
    FILE_NAME=fonts.zip
    DEST=${CACHE_DIR}/${FILE_NAME}

    curl $URL -o $DEST

    mkdir -p ${CACHE_DIR}/fonts
    unzip ${CACHE_DIR}/${FILE_NAME} -d ${CACHE_DIR}/fonts
    mv ${CACHE_DIR}/fonts/*.ttc  /usr/share/fonts/

    EOH

end
