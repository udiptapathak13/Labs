BEGIN{
    pktsend1=0;
    pktrecv=0;
}

{
    e=$1;
    dest=$4;
    src=$3;
    if(e=="+" && src==0){
        ++pktsend1;
    }
    if(e=="r" && dest==4){
        ++pktrecv;
    }
}

END{
    printf("No. of packets sent by source 0 : %d\n", pktsend1);
    printf("No. of packets received by destination 4 : %d\n", pktrecv);
    printf("No. of packets lost : %d\n", pktsend1 - pktrecv);
}
