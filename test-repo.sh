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
git checkout fuse_0.20
fusepm install --unoproj *_example.unoproj
exitcode=$?
if [ $exitcode -ne 0 ]; then
	echo Failed fusepm install $name : $exitcode
	exit $exitcode
fi
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
uno build -tAndroid -DGRADLE *_example.unoproj
exitcode=$?
if [ $exitcode -ne 0 ]; then
	echo Failed Android $name : $exitcode
	exit $exitcode
fi
