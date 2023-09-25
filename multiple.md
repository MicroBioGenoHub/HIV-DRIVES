# Description

If you want to run multiple samples using HIV-DRIVES without extra coding, we have developed a helper command - HIV-DRIVES_multiple that can be run following the instructions below

- You will need to fill in a tab delimited file.
- In the file start with a line stating; mode: <choose from all, varcall, or resistance>. For instance, if you want to run the all mode, the line would state, mode: all
- The following lines are followed by columns describing the path to the fastq, sanger, and fasta files. Refer to the templates ([all mode](all_multiple.tab), [varcall mode](varcall_multiple.tab), [resistance mode](resistance_multiple.tab)) in this repo for instructions
- Template files ([all mode](all_multiple.tab), [varcall mode](varcall_multiple.tab), [resistance mode](resistance_multiple.tab)) have been provided to help in filling the tab files
- Note: If the files are not in the same path of the directory where you are running the command, specify absolute paths within the tab file

After filling the tab file, run the command below

```
HIV-DRIVES_multiple --intab <path of the tab file>
```

For different case scenarios, refer to cases.md
