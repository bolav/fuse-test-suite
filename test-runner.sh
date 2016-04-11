while read in; do 
echo "$in";
./test-repo.sh "$in";
exitcode=$?
if [ $exitcode -ne 0 ]; then
	echo Failed $in
	exit $exitcode
fi
done < urls
