# Description

1. I have forward and reverse reads. I want to get resistance profiles of my sample at the end

```
HIV-DRIVES -f <path of forward read> -r <path of reverse read> -o <output directory to be created> --all true
```
2. Same as above (1) but with multiple samples
	- To run, create a tab separated file. This file starts with a line that describes the mode to run. The line is followed by 4 columns. Each line or row represents a single sample. The first column should have the name of the directory to be created for that sample, second column has path of the forward read, third column has path of the reverse read, and the fourth column describing the layout which is paired for this case
	- Refer to [Multiple sample instructions](multiple.md) for a detailed description
```
HIV-DRIVES_multiple --intab <created tab separated file>
```
3. I have forward and reverse reads. I only want to perform variant calling and consensus generation

```
HIV-DRIVES -f <path of forward read> -r <path of reverse read> -o <output directory to be created> --varcall true
```
4. Same as above (3) but with multiple samples
	- To run, create a tab separated file. This file starts with a line that describes the mode to run. The line is followed by 4 columns. Each line or row represents a single sample. The first column should have the name of the directory to be created for that sample, second column has path of the forward read, third column has path of the reverse read, and the fourth column describing the layout which is paired for this case
	- Refer to [Multiple sample instructions](multiple.md) for a detailed description
```
HIV-DRIVES_multiple --intab <created tab separated file>
```
5. I have single ended reads. I want to get resistance profiles
	- This applies with those having illumina single ended reads. This also works if one has either forward or reverse reads but not both
```
HIV-DRIVES --single-end true --se <path of single ended read> -o <output directory to be created> --all true
```
6. Same as above (5) but with multiple samples
	- To run, create a tab separated file. This file starts with a line that describes the mode to run. The line is followed by 3 columns. Each line or row represents a single sample. The first column should have the name of the directory to be created for that sample, second column has path of the single ended read, and the third column describing the layout which is se for this case
	- Refer to [Multiple sample instructions](multiple.md) for a detailed description
```
HIV-DRIVES_multiple --intab <created tab separated file>
```
7. I have single ended reads. I want to perform variant calling as well as generate a consensus genome
	- This applies with those having illumina single ended reads. This also works if one has either forward or reverse reads but not both
```
HIV-DRIVES -o <output directory to be created> --single-end true --se <path of single ended read> --varcall true
```
8. Same as above (7) but with multiple samples
	- To run, create a tab separated file. This file starts with a line that describes the mode to run. The line is followed by 3 columns. Each line or row represents a single sample. The first column should have the name of the directory to be created for that sample, second column has path of the single ended read, and the third column describing the layout which is se for this case
	- Refer to [Multiple sample instructions](multiple.md) for a detailed description
```
HIV-DRIVES_multiple --intab <created tab separated file>
```
9. I have a fasta/mulitfasta file, I want to get resistance profiles
```
HIV-DRIVES -o <output directory to be created> --consensus <path of fasta file> --resistance true
```
10. I have several fasta files, I want to get resistance profiles for each
	- To run, create a tab separated file. This file starts with a line that describes the mode to run. The line is followed by 3 columns. Each line or row represents a single sample. The first column should have the name of the directory to be created for that sample, second column has path of the fasta file, and the third column describing  will be consensus for this case
	- Refer to [Multiple sample instructions](multiple.md) for a detailed description
```
HIV-DRIVES_multiple --intab <created tab separated file>
```
11. I have a sanger file in ab1.seq format, I want to get resistance profiles
```
HIV-DRIVES -o <output directory to be created> --sanger <path of ab1.seq file> --resistance true
```
12. I have several sanger files, I want to get resistance profiles for each
        - To run, create a tab separated file. This file starts with a line that describes the mode to run. The line is followed by 3 columns. Each line or row represents a single sample. The first column should have the name of the directory to be created for that sample, second column has path of the ab1.seq file, and the third column describing  will be sanger for this case
        - Refer to [Multiple sample instructions](multiple.md) for a detailed description
```
HIV-DRIVES_multiple --intab <created tab separated file>
```
