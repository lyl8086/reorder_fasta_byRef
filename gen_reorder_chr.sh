#!/bin/bash
conf=$1
seq=$2
out=$3
mkdir $out
# seqkit grep -p '' $seq | seqkit replace -p '' -r '' >$out/.fa
# seqkit grep -p '' $seq | seqkit replace -p '' -r '' | seqkit seq -r -p >$out/.fa
awk -v s=$seq -v o=$out '{
if($3=="+") {print "seqkit grep -p",$1,s," | seqkit replace -p",$1,"-r",$2,">",o"/"$2".fa"};
if($3=="-") {print "seqkit grep -p",$1,s," | seqkit replace -p",$1,"-r",$2,"| seqkit seq -r -p >",o"/"$2".fa"}
}' $conf
