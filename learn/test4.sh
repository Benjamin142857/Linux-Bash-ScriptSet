for i in {1.10000}
do
  echo $RANDOM >> a.txt
done

echo 'max' $(sort -nr a.txt | head -1)
echo 'min' $(sort -n a.txt | head -1)