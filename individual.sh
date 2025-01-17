# Step 1: Preparations
mkdir input_reads
mkdir reference_sequence
mkdir kraken_db
mkdir FastQC
mkdir kraken_output
mkdir aligned_reads
mkdir assemblies
mkdir assembled_db
mkdir results
cp ~/data/BIA/groups/group2/*.fasta reference_sequence/ # 把AMR基因文件和大肠杆菌的参考序列拷贝到reference_sequence文件夹下
cp -r ~/data/kraken/bact_20220725_4GB kraken_db/ # kraken数据库

for i in 20220001023 22220001001 22220001002 22220001004 22220001005  22220001009 22220001011 22220001012 22220001025; do

    cp ~/data/BIA/individual/${i}_* input_reads/ # 把样品的测序结果拷贝到input_reads文件夹下

    # Step 2: Quality Control 
    fastqc -o FastQC/${i} -t 2 input_reads/*gz # Quality control
    cp FastQC/${i}/*.html results/

    # Step 3: Species Identification
    conda activate kraken
    kraken2 --db kraken_db/bact_20220725_4GB \
            --threads 2 \
            --output kraken_output/${i}.kraken2 \
            --report kraken_output/${i}.kreport2 \
            --paired input_reads/${i}_1.fastq.gz input_reads/${i}_2.fastq.gz
    bracken -i kraken_output/${i}.kreport2 \
            -d kraken_db/bact_20220725_4GB \
            -r 100 \
            -o results/${i}_01_species_identification.bracken

    # Step 4: Genome Assembly
    spades.py -t 2 \
            -o assemblies/${i} \
            -1 input_reads/${i}_1.fastq.gz \
            -2 input_reads/${i}_2.fastq.gz # Genome assembly
    bash ~/data/assembly/assembly_stats.sh assemblies/${i}/contigs.fasta > results/${i}_02_assembly_stats.txt # Assembly statistic
    cp assemblies/${i}/contigs.fasta results/${i}_assembly.fasta

    # Step 5: Genome Alignment
    # 对每个样品的组装基因组进行BLAST比对
    makeblastdb -in assemblies/${i}/contigs.fasta  \
            -dbtype nucl \
            -out assembled_db/ \
            contigs_db=assembled_db/
    # 运行BLASTn
    blastn -query reference_sequence/AMR_genes.fasta \
    -db assembled_db/ \
    -out results/${i}_03_AMR_blast_results.txt \
    -evalue 1e-10 \
    -outfmt 6
    
    # Step 6: Read Mapping
    bwa index reference_sequence/NC_013654.fasta -p reference_sequence/Escherichia_SE15
    # 比对样品到参考基因组，排序，输出为bam文件
    bwa mem -t 2 \
            reference_sequence/Escherichia_SE15 \
            input_reads/${i}_1.fastq.gz \
            input_reads/${i}_2.fastq.gz \
            | samtools view -bh -F4 \
            | samtools sort -o aligned_reads/${i}_sorted.bam
    # 索引bam文件，得到了bai文件，可以一起导入IGV
    samtools index aligned_reads/${i}_sorted.bam
    cp aligned_reads/${i}_sorted.bam results/${i}_04_sorted.bam
    cp aligned_reads/${i}_sorted.bam.bai results/${i}_04_sorted.bam.bai
    # 检测gyrA基因的突变
    bcftools mpileup -f reference_sequence/NC_013654.fasta aligned_reads/${i}_sorted.bam | bcftools call -mv -Oz -o aligned_reads/${i}_variants.vcf.gz
    bcftools index aligned_reads/${i}_variants.vcf.gz
    # 检查S83L和D87N突变
    bcftools view aligned_reads/${i}_variants.vcf.gz | grep -E "2286204|2286193" > results/sample${i}_05_variants.txt
done