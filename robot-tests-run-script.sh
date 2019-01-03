cd /robot-tests-volume/src

# clean previous output files
rm -f output/output.xml
rm -f output/rerun.xml
rm -f output/first_run_log.html
rm -f output/second_run_log.html

echo
echo "#######################################"
echo "# Running test suite a first time     #"
echo "#######################################"
echo
if xvfb-run --server-args="-screen 0 1920x1080x24" \
      robot --outputdir=./output ${TEST_PATH}; then
  # we stop the script here if all the tests were OK
	echo "we don't run the tests again as everything was OK on first try"
	exit 0
fi
# otherwise we go for another round with the failing tests
# we keep a copy of the first log file
cp output/log.html  output/first_run_log.html
fail="1"
# we launch the tests that failed
echo
echo "#######################################"
echo "# Running again the tests that failed #"
echo "#######################################"
echo
if xvfb-run --server-args="-screen 0 1920x1080x24" \
      robot --rerunfailed output/output.xml \
            --outputdir=./output --output rerun ${TEST_PATH}; then
  echo "Tests passed on second try"
else
  echo "Test failed on second try."
  fail="2"
fi
# Robot Framework generates file rerun.xml
# we keep a copy of the second log file
cp output/log.html  output/second_run_log.html
# Merging output files
echo
echo "########################"
echo "# Merging output files #"
echo "########################"
echo
rebot --nostatusrc --outputdir ./output --merge output/output.xml output/rerun.xml
# Robot Framework generates a new output.xml

if [ $fail -eq 2 ]; then
    echo
    echo "Exit code 1"
    echo
    exit 1
fi
