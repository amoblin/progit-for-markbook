
root=~/proj/reference-source/progit
myhome=`pwd`

ls|grep -v update.sh|xargs rm -rf

cd $root

for i in `ls -F|grep /$`; do
    mkdir $myhome/$i
    ln $i/*/*.markdown $myhome/$i
done

rmdir *
