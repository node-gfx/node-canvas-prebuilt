# write recurisve dependencies of canvas.node into depends.csv
./depends -c -oc:depends.csv node_modules/canvas/build/Release/canvas.node

# case-insensitive intersection of 3rd column of depends.csv 
# and all files ending in .dll in the mingw64 directory
copies=$(comm -12 \
  <(cat depends.csv | cut -d ',' -f2 | sed 's/"//g' | tr '[:upper:]' '[:lower:]' | sort) \
  <(find /mingw64/bin -name '*.dll' -printf "%f\n" | tr '[:upper:]' '[:lower:]' | sort) \
);

for dll in $copies; do
	cp /mingw64/bin/$dll node_modules/canvas/build/Release
done;

