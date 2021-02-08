## init count
COUNT=0

## (add)
PV=/pv/save.dat

if [ -z "$INTERVAL" ]; then
    INTERVAL=3
fi

## (add2)
if  [-f $PV ]; then
    COUNT=`cat  $PV`
    rm -f $PV
fi

## (add3)
save()  {
    echo $COUNT > $PV
    exit
}
trap save TERM

##  main  loop
while [ true ];
do
    # TM=`date|awk '{print $4}'`
    printf "[%s]" $COUNT
    echo `date '+%y/%m/%d %H:%M:%S'` 
    let COUNT=COUNT+1
    sleep $INTERVAL
done
