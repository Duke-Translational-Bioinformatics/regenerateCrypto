## regenerateCrypto.R

## Erich S. Huang
## Division of Translational Bioinformatics
## Department of Biostatistics & Bioinformatics
## Duke University School of Medicine
## Durham, NC
## erich.huang@duke.edu

## A demonstration of how we can leverage multiple services
## to regenerate an analysis of Cryptococcus image data
## using spectral clustering

## REQUIRE
require(rGithubClient)

## ACCESS THE CLEARSCIENCE REPO CODE USING THE GITHUB API
## The rGithubClient uses the Github API to facilitiate R talking to Github.
## First, we bring down the metadata for the code repository,

stmRepo <- getRepo('duke-translational-bioinformatics/crypto-spectral-image-clustering-demo')

## and then sequentially source in the code and execute it. 

figFxNames <- as.list(stmRepo@tree$path[3])
figFxList <- lapply(figFxNames, function(name){
  figFx <- sourceRepoFile(stmRepo, name)
})

## In execution, the code utlizes the synapseClient to talk to Synapse 
## via its own API, and brings down the relevant data from Synapse.

sourcedFxs <- lsf.str()
lapply(sourcedFxs, function(x){
  eval(call(x))
})
