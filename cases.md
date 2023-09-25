# Description

1. I have forward and reverse reads. I want to get resistance profiles of my sample at the end

```
HIV-DRIVES -f <path of forward read> -r <path of reverse read> -o <output directory to be created> --all true
```
2. Same as above (1) but with multiple samples
	- Working up to generation of a complex json file
	- Manipulation of the complex json file to produce a user friendly one: This has been implemented
	- Other file formats: Pending
	- We still have a problem with subtype and the aligner
	- To run, create a tab separated. This file starts with a line that describes the mode to run. The line is followed by 3 columns. Each line or row represents a single sample. The first column should have the name of the directory to be created for that sample, second column has path of the forward read, third column has path of the reverse read
```
bash HIV-DRIVES_multiple.sh <created tab separated file>
```
3. I have forward and reverse reads. I only want to perform variant calling and consensus generation

```
HIV-DRIVES -f <path of forward read> -r <path of reverse read> -o <output directory to be created> --varcall true
```
4. Same as above (3) but with multiple samples
	- Turn the mode to varcall in the tab file
```
bash HIV-DRIVES_multiple.sh <created tab separated file>
```
5. I have single ended reads. I want to get resistance profiles
	- This applies with those having illumina single ended reads. This also works if one has either forward or reverse reads but not both
```
HIV-DRIVES --single-end true --se <path of single ended read> -o <output directory to be created> --all true
```
6. Same as above (5) but with multiple samples
	- Fill in the tab separated file
```
bash HIV-DRIVES_multiple.sh <created tab separated file>
```
7. I have single ended reads. I want to perform variant calling as well as generate a consensus genome
	- This applies with those having illumina single ended reads. This also works if one has either forward or reverse reads but not both
```
bash HIV-DRIVES.sh -o <output directory to be created> --single-end true --se <path of single ended read> --varcall true
```
8. Same as above (7) but with multiple samples
	- Turn the mode to varcall in the tab file
```
bash HIV-DRIVES_multiple.sh <created tab separated file>
```
