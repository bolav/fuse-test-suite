name=$1
rm -rf clone
echo git clone $name clone
git clone $name clone
exitcode=$?
if [ $exitcode -ne 0 ]; then
	echo Failed git $name : $exitcode
	exit $exitcode
fi
cd clone
uno build *_example.unoproj
exitcode=$?
if [ $exitcode -ne 0 ]; then
	echo Failed uno $name : $exitcode
	exit $exitcode
fi
uno build -tiOS *_example.unoproj
exitcode=$?
if [ $exitcode -ne 0 ]; then
	echo Failed iOS $name : $exitcode
	exit $exitcode
fi
uno build -tAndroid *_example.unoproj
exitcode=$?
if [ $exitcode -ne 0 ]; then
	echo Failed Android $name : $exitcode
	exit $exitcode
fi
