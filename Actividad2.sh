touch $1

for f in a*.txt; do
	head -3 $f | tail -1 >> $1
done
