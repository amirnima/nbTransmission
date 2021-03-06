
#' Dataset with results of \code{\link{nbProbabilities}}
#' 
#' A ordered dataset created from \code{\link{pairData}} of the outbreak of 100 individuals 
#' including the relative transmission probabilities for each pair estimated using the function
#' \code{\link{nbProbabilities}}. The code to recreate this dataset from \code{\link{pairData}} 
#' is shown below.
#' 
#' @format A data frame with 9900 rows and 24 variables:
#' \describe{
#' \item{pairID}{A pair-level ID variable (the individual IDs separated by an '_').}
#' \item{label}{The label for the run, here "SNPs".}
#' \item{pAvg}{The mean transmission probability for the pair over all runs.}
#' \item{pSD}{The standard deviation of the transmission probability for the pair over all runs.}
#' \item{pScaled}{The mean relative transmission probability for the pair over
#'         all runs: pAvg scaled so that the probabilities for all infectors per infectee add to 1.}
#' \item{pRank}{The rank of the probability of the the pair out of all pairs for that
#'        infectee (in case of ties all values have the minimum rank of the group).}
#' \item{nSamples}{The number of probability estimates that contributed to pAvg. This
#'        represents the number of prediction datasets this pair was included in over the 10x1
#'        cross prediction repeated 50 times.}
#' \item{individualID.1}{The ID of the potential "infector".}
#' \item{individualID.2}{The ID of the potential "infectee".}
#' \item{transmission}{Did individual.1 truly infect individual.2?}
#' \item{snpDist}{The number of SNPs between the individuals.}
#' \item{infectionDate.1}{The date and time of infection of individualID.1.}
#' \item{infectionDate.2}{The date and time of infection of individualID.2.}
#' \item{sampleDate.1}{The date and time of sampling of individualID.1.}
#' \item{sampleDate.2}{The date and time of sampling of individualID.2.}
#' \item{sampleDiff}{The number of days between sampleDate.1 and sampleDate.2.}
#' \item{infectionDiff}{The number of days between infectionDate.1 and infectionDate.2.}
#' \item{infectionDiffY}{The number of years between infectionDate.1 and infectionDate.2.}
#' \item{timeCat}{A categorical representation of infectionDiff: <1y, 1-2y, 2-3y, 3-4y, 4-5y, >5y.}
#' \item{Z1}{Pair-level covariate derived from X1: 1 if match, 0 if not match.}
#' \item{Z2}{Pair-level covariate derived from X2: 1 if match, 0 if not match.}
#' \item{Z3}{Pair-level covariate derived from X3: 1 if a-a, 2 if b-b, 3 if a-b, 4 if b-a.}
#' \item{Z4}{Pair-level covariate derived from X4: 1 if match, 2 if adjacent, 2 otherwise.}
#' \item{snpClose}{Logical value indicating if a pair is a probable link. 
#'          TRUE if the pair has fewer than 3 SNPs, FALSE if the pair has more than 12 SNPs, NA otherwise}
#' }
#' 
#' @examples
#' 
#' # ## NOT RUN ##
#' # ## This is the code used to create this dataset ##
#' # orderedPair <- pairData[pairData$infectionDiff > 0, ]
#' # orderedPair$snpClose <- ifelse(orderedPair$snpDist < 3, TRUE,
#' #                         ifelse(orderedPair$snpDist > 12, FALSE, NA))
#' # set.seed(0)
#' # covariates = c("Z1", "Z2", "Z3", "Z4", "timeCat")
#' # resGen <- nbProbabilities(orderedPair = orderedPair,
#' #                             indIDVar = "individualID",
#' #                             pairIDVar = "pairID",
#' #                             goldStdVar = "snpClose",
#' #                             covariates = covariates,
#' #                             label = "SNPs", l = 1,
#' #                             n = 10, m = 1, nReps = 50)
#' # nbResults <- merge(resGen[[1]], orderedPair, by = "pairID", all = TRUE)
"nbResults"
