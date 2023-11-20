fclName=paramHeader.GENIE.fcl
InputFile=/dune/data/users/jwolcott/nd/nd-lar-reco/caf/PicoRun4.1/2x2+MINERvA-v0/PicoRun4.1_1E17_RHC.larnd.00000.caf.root
OutputFile=output.root

UpdateReweight -c ${fclName} -i ${InputFile} -o ${OutputFile} -N 1
