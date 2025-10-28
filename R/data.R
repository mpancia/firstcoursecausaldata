#' @importFrom tibble tibble
NULL

#' Lalonde (1986) National Supported Work Dataset
#'
#' A dataset from Robert Lalonde's 1986 study "Evaluating the Econometric
#' Evaluations of Training Programs with Experimental Data". The dataset
#' contains information from the National Supported Work (NSW) program,
#' a temporary employment program designed to help disadvantaged workers
#' improve their labor market prospects.
#'
#' @format A data frame with 16,177 observations and 10 variables:
#' \describe{
#'   \item{treat}{Logical. Treatment indicator (TRUE = received NSW training, FALSE = control group)}
#'   \item{age}{Integer. Age in years}
#'   \item{educ}{Integer. Years of education completed}
#'   \item{black}{Logical. TRUE if respondent is Black}
#'   \item{hispan}{Logical. TRUE if respondent is Hispanic}
#'   \item{married}{Logical. TRUE if respondent is married}
#'   \item{nodegree}{Logical. TRUE if respondent has no high school diploma}
#'   \item{re74}{Double. Real earnings in 1974 (pre-treatment)}
#'   \item{re75}{Double. Real earnings in 1975 (pre-treatment)}
#'   \item{re78}{Double. Real earnings in 1978 (post-treatment outcome)}
#' }
#'
#' @source
#' LaLonde, Robert J. "Evaluating the econometric evaluations of training programs
#' with experimental data." The American economic review (1986): 604-620.
#'
#' Data obtained from Harvard Dataverse:
#' \url{https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/ZX3VEV}
#'
#' @examples
#' \dontrun{
#' data(lalonde)
#' summary(lalonde)
#' table(lalonde$treat)
#' mean(lalonde$re78[lalonde$treat == TRUE]) # Average earnings for treated
#' mean(lalonde$re78[lalonde$treat == FALSE]) # Average earnings for control
#' }
"lalonde"

#' Resume Audit Study Dataset
#'
#' A dataset from Bertrand and Mullainathan (2004) studying racial discrimination
#' in the labor market. The researchers conducted a randomized experiment by
#' sending fictitious resumes with either Black-sounding or White-sounding names
#' to help-wanted ads in Boston and Chicago newspapers to measure the effect
#' of perceived race on callback rates for interviews.
#'
#' @format A data frame with 4,870 observations and 4 variables:
#' \describe{
#'   \item{firstname}{Character. First name used on the resume}
#'   \item{sex}{Factor. Sex of the applicant ("male" or "female")}
#'   \item{race}{Factor. Perceived race based on the name ("black" or "white")}
#'   \item{call}{Logical. Callback indicator (TRUE = received callback, FALSE = no callback)}
#' }
#'
#' @source
#' Bertrand, M., & Mullainathan, S. (2004). Are Emily and Greg More Employable
#' Than Lakisha and Jamal? A Field Experiment on Labor Market Discrimination.
#' \emph{American Economic Review}, 94(4), 991-1013.
#'
#' Data obtained from Harvard Dataverse:
#' \url{https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/ZX3VEV}
#'
#' @examples
#' \dontrun{
#' data(resumecallback)
#' summary(resumecallback)
#' table(resumecallback$race)
#' mean(resumecallback$call[resumecallback$race == "white"])  # Callback rate for white-sounding names
#' mean(resumecallback$call[resumecallback$race == "black"])  # Callback rate for black-sounding names
#' }
"resumecallback"
