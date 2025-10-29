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

#' Finasteride Multicenter Trial Dataset
#'
#' A dataset from Gould (1998) containing summary statistics from a stratified
#' randomized trial studying the efficacy and tolerability of finasteride for
#' treating benign prostatic hyperplasia (BPH). Within each of the 29 centers,
#' patients were randomized into three arms: control, finasteride 1mg, and
#' finasteride 5mg. The centers serve as strata in this stratified randomized
#' experiment (SRE).
#'
#' @format A data frame with 29 observations (centers) and 10 variables:
#' \describe{
#'   \item{center}{Integer. Center ID (1-29)}
#'   \item{n0}{Integer. Sample size in control group}
#'   \item{mean0}{Double. Mean change in symptom score for control group}
#'   \item{sd0}{Double. Standard deviation of change for control group}
#'   \item{n1}{Integer. Sample size in finasteride 1mg group}
#'   \item{mean1}{Double. Mean change in symptom score for finasteride 1mg group}
#'   \item{sd1}{Double. Standard deviation of change for finasteride 1mg group}
#'   \item{n5}{Integer. Sample size in finasteride 5mg group}
#'   \item{mean5}{Double. Mean change in symptom score for finasteride 5mg group}
#'   \item{sd5}{Double. Standard deviation of change for finasteride 5mg group}
#' }
#'
#' @details
#' The outcome is the change from baseline in total symptom score for BPH.
#' The total symptom score ranges from 0 to 36 (sum of 9 questions, each scored 0-4)
#' about symptoms of impaired urinary ability. Negative values indicate improvement
#' in symptoms.
#'
#' @source
#' Gould, A. Lawrence. "Multi‐centre trial analysis revisited."
#' Statistics in Medicine 17.15‐16 (1998): 1779-1797.
#'
#' Data obtained from Harvard Dataverse:
#' \url{https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/ZX3VEV}
#'
#' @examples
#' \dontrun{
#' data(finasteride)
#' summary(finasteride)
#' }
"finasteride"

#' STAR Experiment Dataset
#'
#' A dataset from Imbens and Rubin (2015) containing data from the Student/Teacher
#' Achievement Ratio (STAR) experiment conducted in 1985-1986 in Tennessee. This was
#' a large-scale randomized experiment to evaluate the effect of class size on
#' student achievement. The data is in long format with schools serving as strata.
#'
#' @format A data frame with 68 observations (classrooms) and 4 variables:
#' \describe{
#'   \item{school}{Integer. School ID (1-16), serving as strata in the stratified randomized experiment}
#'   \item{classroom}{Integer. Classroom identifier within each school}
#'   \item{treatment}{Integer. Treatment indicator (1 = small class (13-17 students), 0 = regular class (22-25 students))}
#'   \item{outcome}{Double. Standardized average mathematics score}
#' }
#'
#' @details
#' The STAR experiment was a 4-year study comparing student performance in small
#' classes (13-17 students) versus regular classes (22-25 students). Students were
#' randomly assigned within schools, making this a stratified randomized experiment
#' where schools serve as strata. The outcome represents standardized mathematics
#' scores, allowing for comparison across different assessment scales.
#'
#' This dataset represents a subset of the original STAR data, focusing on the
#' first year of the experiment with mathematics scores as the primary outcome
#' of interest.
#'
#' @source
#' Imbens, Guido W., and Donald B. Rubin. \emph{Causal inference in statistics,
#' social, and biomedical sciences}. Cambridge University Press, 2015.
#'
#' @examples
#' \dontrun{
#' data(imbens2015star)
#' summary(imbens2015star)
#' table(imbens2015star$school)
#' mean(imbens2015star$outcome[imbens2015star$treatment == 1])  # Small classes
#' mean(imbens2015star$outcome[imbens2015star$treatment == 0])  # Regular classes
#' }
"imbens2015star"

#' Job Training Program Dataset
#'
#' A dataset from Koenker and Xiao (2002) containing data from a job training program
#' stratified on quarter. The dataset contains information on the duration before
#' employment for participants in a randomized controlled trial evaluating the
#' effectiveness of job training programs. This is a stratified randomized experiment
#' where quarters serve as strata.
#'
#' @format A data frame with 6,384 observations and 13 variables:
#' \describe{
#'   \item{id}{Integer. Participant ID}
#'   \item{duration}{Double. Duration before employment (time to employment outcome)}
#'   \item{treatment}{Logical. Treatment indicator (FALSE = control, TRUE = job training program)}
#'   \item{female}{Logical. Gender indicator (FALSE = male, TRUE = female)}
#'   \item{black}{Logical. Race indicator (FALSE = not Black, TRUE = Black)}
#'   \item{hispanic}{Logical. Ethnicity indicator (FALSE = not Hispanic, TRUE = Hispanic)}
#'   \item{ndependents}{Integer. Number of dependents}
#'   \item{recall}{Logical. Recall indicator (FALSE = no recall, TRUE = recall)}
#'   \item{young}{Logical. Age indicator (FALSE = not young, TRUE = young)}
#'   \item{old}{Logical. Age indicator (FALSE = not old, TRUE = old)}
#'   \item{quarter}{Factor. Quarter of randomization (0-5), serving as strata in the stratified randomized experiment}
#'   \item{durable}{Logical. Durable goods indicator (FALSE = no, TRUE = yes)}
#'   \item{lusd}{Logical. Long-term unemployment indicator (FALSE = no, TRUE = yes)}
#' }
#'
#' @details
#' The dataset represents a job training program evaluation where participants were
#' randomized to receive job training or serve as controls. Randomization was
#' stratified by quarter to ensure balance across time periods. The primary outcome
#' is the duration before employment, representing the time it took for participants
#' to find employment after the intervention.
#'
#' @source
#' Koenker, Roger, and Zhijie Xiao. "Inference on the quantile regression process."
#' \emph{Econometrica} 70.4 (2002): 1583-1612.
#'
#' Data obtained from Harvard Dataverse:
#' \url{https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/ZX3VEV}
#'
#' @examples
#' \dontrun{
#' data(koenker2002)
#' summary(koenker2002)
#' table(koenker2002$treatment)
#' mean(koenker2002$duration[koenker2002$treatment == TRUE])  # Treatment group
#' mean(koenker2002$duration[koenker2002$treatment == FALSE])  # Control group
#' table(koenker2002$quarter)  # Distribution across strata
#' }
"koenker2002"

#' Electric Company Experiment Dataset
#'
#' A dataset from the Children's Television Workshop
#' experiment evaluating The Electric Company educational television show.
#'
#' @format A data frame with 96 observations and 7 variables:
#' \describe{
#'   \item{city}{Factor. City identifier}
#'   \item{grade}{Integer. Grade level (1-4)}
#'   \item{treated_pre_test}{Double. Pre-test reading scores for treated classrooms}
#'   \item{treated_post_test}{Double. Post-test reading scores for treated classrooms}
#'   \item{control_pre_test}{Double. Pre-test reading scores for control classrooms}
#'   \item{control_post_test}{Double. Post-test reading scores for control classrooms}
#'   \item{supplement}{Factor. Supplemental material indicator ("S" or "R")}
#' }
#'
#' @details
#' The experiment contains eight pairs of classes with one class randomly assigned
#' to watch The Electric Company during reading period, while the other received
#' standard instruction. Pre-test scores serve as covariates and post-test scores
#' are the outcomes of interest.
#'
#' @source
#' Data obtained from Andrew Gelman's website:
#' \url{https://stat.columbia.edu/~gelman/arm/examples/ARM_Data.zip}
#'
#' @examples
#' \dontrun{
#' data(electriccompany)
#' summary(electriccompany)
#' mean(electriccompany$treated_post_test) - mean(electriccompany$control_post_test)
#' }
"electriccompany"

#' Academic Performance Incentives Experiment Dataset
#'
#' A dataset from Angrist et al. (2009) containing data from a randomized experiment
#' conducted at a Canadian university to evaluate different strategies to improve
#' academic performance among college freshmen. The data focuses on the control group
#' and the treatment group offered academic support services and financial incentives
#' for good grades.
#'
#' @format A data frame with 1,656 observations and 48 variables:
#' \describe{
#'   \item{GPA_year1, GPA_year2}{Double. 1st and 2nd year GPA}
#'   \item{age}{Double. Age}
#'   \item{gpa0}{Double. High school GPA}
#'   \item{control}{Logical. Control group indicator (TRUE = control, FALSE = treatment)}
#'   \item{female}{Logical. Female dummy}
#'   \item{english}{Logical. Mother tongue is English}
#'   \item{credits_earned1, credits_earned2}{Double. Credits earned in years 1 and 2}
#'   \item{totcredits_year1}{Double. Total credits attempted}
#'   \item{finish4}{Logical. Intends to finish in 4 years}
#'   \item{goodstanding_year1, goodstanding_year2}{Logical. Good standing in years 1 and 2}
#'   \item{prob_year1, prob_year2}{Logical. On probation in years 1 and 2}
#'   \item{mom_edn, dad_edn}{Double. Mother and father education}
#'   \item{mom1, mom2, dad1, dad2}{Logical. Mother/father HS and college graduate indicators}
#'   \item{mtongue, sex}{Character. Mother tongue and sex}
#'   \item{hsgroup}{Double. High school group}
#'   \item{chooseUTM}{Logical. At 1st choice school}
#'   \item{hcom}{Logical. Lives at home}
#'   \item{mathsci}{Double. Number of math and science credits attempted}
#'   \item{work1}{Logical. Plans to work while in school}
#'   \item{numcourses_nov1}{Double. Courses enrolled as of fall 2005}
#'   \item{grade_20059_fall}{Double. Fall grade}
#'   \item{lastmin}{Double. How often leaves studying until last minute}
#'   \item{lm_never, lm_rarely}{Logical. Never/rarely puts off studying for tests}
#'   \item{sfp, sfp_p, sfsp, sfsp_p}{Logical. Offered/signed-up for student support programs}
#'   \item{sfpany, sfpany_p}{Logical. Offered/signed-up for any support program}
#'   \item{ssp, ssp_p}{Logical. Offered/signed-up for student services program}
#'   \item{used_ssp, used_fsg, used_adv}{Logical. Received SSP services, attended FSGs, met advisor}
#'   \item{compsurv, noshow, signup}{Logical. Completed survey, no show, signed up for STAR}
#'   \item{graddeg}{Logical. Wants more than a BA}
#' }
#'
#' @details
#' The experiment randomly assigned college freshmen to different treatment conditions
#' including academic support services (SFP, SSP, SFSP) and financial incentives for good
#' grades. The primary outcomes are academic performance measures such as GPA in the
#' first and second years, completion rates, and academic standing.
#'
#' @source
#' Angrist, J., Lavy, V., Schlosser, A. (2009). The effects of high
#' stakes high school achievement awards: Evidence from a randomized trial.
#' \emph{American Economic Review}, 99(4), 1384-1414.
#'
#' Data obtained from Harvard Dataverse:
#' \url{https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/ZX3VEV}
#'
#' @examples
#' \dontrun{
#' data(angrist2009)
#' summary(angrist2009)
#' table(angrist2009$control)
#' mean(angrist2009$GPA_year1[!angrist2009$control])  # Treatment group GPA
#' mean(angrist2009$GPA_year1[angrist2009$control])   # Control group GPA
#' }
"angrist2009"
