#! /bin/sh
echo Checking for the leap seconds table...
local_url=`printenv CDF_LEAPSECONDSTABLE`
if [ -z "$local_url" ]; then
  echo CDF_LEAPSECONDSTABLE environment variable is not defined...
  echo Internal hard-coded leap seconds table may be used...
  if [ -n "$CDF_BIN" ]; then
    result=`$CDF_BIN/cdfleapsecondsinfo -nodump`
    local_leap=`echo $result | cut -d " " -f31`
  else
    echo "Enter the latest, installed CDF directory: ";
    read ls_folder
    if [ -f "$ls_folder/CDFLeapSeconds.txt" ]; then  
      local_leap=`tail -1 $ls_folder/CDFLeapSeconds.txt | awk '{ print $1"-"$2"-"$3 }'`
    else
      echo "Error... CDF installation not found in $ls_folder."
      exit 0;
    fi 
  fi  
else
  local_leap=`tail -1 ${local_url}| awk '{ print $1"-"$2"-"$3 }'`;
  ls_folder=`dirname $local_url`
fi
remote_url="http://cdf.gsfc.nasa.gov/html/CDFLeapSeconds.txt"
isCurlAvail=`which curl`
if [ `echo "$isCurlAvail" | grep -c "no "` -eq 1 ]; then
 `wget -q -O /tmp/CDFLeapSeconds.txt ${remote_url}`
  if [ $? -ne 0 ]; then
    echo "Error... ${remote_url} not found.";
    exit 0;
  fi
else
  `curl -s -o /tmp/CDFLeapSeconds.txt ${remote_url}`
  if [ $? -ne 0 ]; then
    echo "Error... ${remote_url} not found.";
    exit 0;
  fi
fi
remote_leap=`tail -1 /tmp/CDFLeapSeconds.txt | awk '{ print $1"-"$2"-"$3 }'`
lyear=`echo $local_leap | cut -d- -f1`
lmonth=`echo $local_leap | cut -d- -f2`
lday=`echo $local_leap | cut -d- -f3`
ryear=`echo $remote_leap | cut -d- -f1`
rmonth=`echo $remote_leap | cut -d- -f2`
rday=`echo $remote_leap | cut -d- -f3`
localdate=`expr $lyear*10000+$lmonth*100+$lday | bc`
remotedate=`expr $ryear*10000+$rmonth*100+$rday | bc`
if [ $localdate -lt $remotedate ]; then
  echo "Newer leapsecond(s) was added to CDFLeapSeconds.txt at the CDF home page than local version."
  echo "Please update your CDF installation that includes the latest CDFLeapSeconds.txt from http://cdf.gsfc.nasa.gov."
else
  echo ""
  echo "Local CDFLeapSeconds.txt in $ls_folder is up-to-date."
  echo ""
fi
