# reorder_fasta_byRef
Reorder fasta chromosome ID according the reference genomes

1. mapping the fasta to the reference genome to get the correspondence:

   `
   bash run_minimap_syn.sh reference_fasta query_fasta Q_vs_S
   `

   check Q_vs_S.pdf and make a conf file with three columns: original_id,new_id and orientation

2. generate cmdlines:

   `
   bash gen_reorder_chr.sh your_conf query_fasta tmp_out >run.cmd
   `
3. run cmdlines using ParaFly:
   
   `ParaFly -c run.cmd -CPU 8`

4. combine fasta files in tmp_out:

   `cat tmp_out/*.fa >query_fasta_reordered.fa`

   You will get query_fasta_reordered.fa as the newly reordered fasta by reference   
   
   
