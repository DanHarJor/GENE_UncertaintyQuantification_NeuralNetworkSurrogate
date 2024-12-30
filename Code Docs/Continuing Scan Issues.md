
# Parameters file broken by gene

When trying to continue a scan the gene_status file was always coming up started and not finished. I was getting an error in the geneerr.log file that the parameters file could not be read. I found that there was an indent missing in all the parameters files that stopped them from being read. 

Changing this 
`&scan`
	`scan_dims = 4 1 1 1`
`par_in_dir = '/scratch/project_462000451/gene_out/gene_auto/code_debug_simtimelim/ex-code_debug_simtimelim_batch-0/scanfiles0000/in_par'`
`/`

to this :
`&scan`
	`scan_dims = 4 1 1 1`
	`par_in_dir = '/scratch/project_462000451/gene_out/gene_auto/code_debug_simtimelim/ex-code_debug_simtimelim_batch-0/scanfiles0000/in_par'`
`/`

made it work when I tried continue scan.

Here is a record of me running code_bug_tester for continue scans for how this error manifolds.

Clean slate

Initial run, 
geneer looks great, no errors
in_par/gene_status, says it is all finished, great

code debug to the point where it looks at the status.

It sees it is finished, all good

Then it continues to run the runner.continue_with_new_param function and get to the stage where it is altering all the parameters files. And tried to continue the run with sbatch continue.cmd in the problem directory.

Then the parameters are missing the indent,
the status is coming up all 's'. And it looks like the issue is with my alter parameters and not gene. Although moments ago I was certain it was gene and the problem was occuring before alter parameters was ran. When I do tests with alter parameters with the scan group having the correct indent. It does not break it. I think there is an issue when gene inserts the &scan group

