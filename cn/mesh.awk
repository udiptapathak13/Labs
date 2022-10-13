BEGIN{
    pktsend1=0;
    pktsend2=0;
    pktsend3=0;
    pktrecv=0;
}

{
    e=$1;
    dest=$4;
    src=$3;
    if(e=="+" && src==0){
        ++pktsend1;
    }
    if(e=="+" && src==1){
        ++pktsend2;
    }
    if(e=="r" && dest==2){
        ++pktsend3;
    }
    if(e=="r" && dest==3){
        ++pktrecv;
    }
}

END{
    printf("No. of packets sent by source 0 : %d\n", pktsend1);
    printf("No. of packets sent by source 1 : %d\n", pktsend2);
    printf("No. of packets sent to destination 2 : %d\n", pktsend3);
    printf("No. of packets received by destination : %d\n", pktrecv);
    printf("No. of packets lost : %d\n", pktsend1 + pktsend2 + pktsend3 - pktrecv);
}
