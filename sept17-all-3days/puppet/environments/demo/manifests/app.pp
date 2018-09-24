node /nodep[0-9]/ {
   $myvar = hiera('hieraport')
   notify {"This is the data $myvar":}
}
