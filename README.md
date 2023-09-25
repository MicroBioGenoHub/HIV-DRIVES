# HIV-DRIVES: HIV Drug Resistance Identification, Variant Evaluation, & Surveillance

HIV-DRIVES is a pipeline designed to perform HIV Drug resistance profiling, Variant Evaluation, and Surveillance while giving an easy to read pdf report besides the other output files. HIV-DRIVES supports illumina data in paired and single ended fastq format, sanger data in ab1.seq format, and both fasta and multiple fasta files. Given illumina data, HIV-DRIVES additionally separates the patient's reads from the viral reads before it proceeds with the downstream processes. Therefore, this facilitates sharing of viral reads while protecting the patient's privacy. HIV-DRIVES is supported by both sierra-local and quasitools in the background

# Motivation

The global prevalence of resistance to the Human Immunodeficiency Virus (HIV) antiretroviral therapy (ART) drugs emphasizes the need to fast-track the transition to the newer regimens such as dolutegravir-based combinations. In order to slow down or halt HIV drug resistance (HIVDR), all stakeholders need to promote the availability of optimal medicines to treat HIV infections, support retention in care and optimal adherence to treatment, and increase access and use of viral load testing to know if HIV treatment is working, and rapidly switch regimens in cases of confirmed treatment failure and lastly, use of next-generation sequencing (NGS) for HIVDR profiling to guide treatment.  Africa also accounts for nearly two thirds of the global total of new HIV infections and remains the most affected region, with at least 25.7 million people living with HIV in 2018. COVID-19 catapulted routine NGS in many national public health laboratories in Africa and is poised to support genomic activities in different disease programs including HIV. A number of countries embracing performing NGS-HIVDR are facing the challenge of bioinformatics analysis and interpretation of the data for patient management. We present HIV-DRIVES (HIV Drug Resistance Identification, Variant Evaluation, and Surveillance), an NGS-HIVDR bioinformatics pipeline that has been developed and validated using Illumina short-reads, sanger ab1.seq files, and fasta files to HIVDR testing and interpretation.

# Pipeline features

HIV-DRIVES is able to perform:
1. Poor read trimming using trim_galore
2. Variant calling and consensus genome generation
3. Host Decontamination: The program removes host reads and produces host free fastq files. This is motivated by the issue of patient privacy
4. Consensus generation: The program uses hydra within the quasitools to generate a consesus sequence
5. Variant calling: The program uses hydra within the quasitools to detect variants within the query HIV genomes
6. Resistance profiling and mutation detection: This is performed by sierra-local. Sierra-local output is interrogated to give an easy to understand pdf report

Note: Besides, the pdf report, the pipeline produces aavf, vcf, drms20.csv with DRMS above 20 percent prevalence for each gene detected, res.csv with the resistance profiles. This is done for each sample
 
# Installation

```
git clone https://github.com/Kanyerezi30/HIV-DRIVES.git

bash install.sh
```

# How to run currently

```
HIV-DRIVES -o <output_dir> -f <forward read path> -r <reverse read path> --all true
```

# Progress

- Quality assessment has been implemented
- Host Decontamination has been implemented 
- Variant calling has been implemented
- Consensus generation has been implemented

# Next

- Other pathogen decontamination
- Coverage graphs
- Resistance, subtype, mutations, genes detection
- Phylogenetics
- Statistical analysis
- Sanger and minion implementation

Note: Current tests are on Ubuntu 18.04.6 LTS using paired end reads from the illumina platform
