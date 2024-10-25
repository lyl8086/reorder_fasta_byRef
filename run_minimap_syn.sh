#!/bin/bash
g1=$1
g2=$2
out=$3
tag=$4

[ $# -lt 3 ] && echo $0 [ref] [query] [out] && exit 0
[ -z "$tag" ] && tag='asm20'
[ ! -f "$out.paf" ] && minimap2 -t 40 -x $tag $g1 $g2 >$out.paf
/opt/bio/tools/paf2dotplot/paf2dotplot.r \
-o $out \
-s \
-m 5000 $out.paf
