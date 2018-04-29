
bash "grab chinese fonts" do

  user 'root'
  group 'root'
  code <<-EOH
    URL=https://s3.ap-northeast-1.amazonaws.com/chinese-fonts/fonts.zip

    CACHE_DIR=/usr/tmp
    FILE_NAME=fonts.zip
    DEST=${CACHE_DIR}/${FILE_NAME}

    curl $URL -o $DEST

    unzip ${CACHE_DIR}/${FILE_NAME} -C ${CACHE_DIR}/fonts
    mv ${CACHE_DIR}/fonts/*.ttc  /usr/share/fonts/

    EOH

end
