git add .
read -p "commit tag: " COMMITTAG
git commit -m $COMMITTAG
git push
