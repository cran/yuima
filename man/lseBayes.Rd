\name{lseBayes}
\alias{lseBayes}
\alias{lseBayes,yuima-method}
\title{Adaptive Bayes Estimator for the Parameters in SDE Model by Using LSE Functions}
\description{Adaptive Bayes estimator for the parameters in a specific type of sde by using LSE functions.}
\usage{
lseBayes(yuima, start, prior, lower, upper, method = "mcmc", mcmc = 1000,
rate =1, algorithm = "randomwalk")
}
\arguments{
  \item{yuima}{a 'yuima' object.}
  \item{start}{initial suggestion for parameter values }
  \item{prior}{a list of prior distributions for the parameters specified by 'code'. Currently, dunif(z, min, max), dnorm(z, mean, sd), dbeta(z, shape1, shape2), dgamma(z, shape, rate) are available. }
  \item{lower}{a named list for specifying lower bounds of parameters}
  \item{upper}{a named list for specifying upper bounds of parameters}
  \item{method}{\code{nomcmc} requires package \code{cubature} }
  \item{mcmc}{number of iteration of Markov chain Monte Carlo method}
  \item{rate}{a thinning parameter. Only the first n^rate observation will be used for inference. }
  \item{algorithm}{Logical value when \code{method = mcmc}. If \code{algorithm = "randomwalk"} (default), the random-walk Metropolis algorithm will be performed. If \code{algorithm = "MpCN"}, the Mixed preconditioned Crank-Nicolson algorithm will be performed.}
}
\details{
\code{lseBayes} is always performed by Rcpp code.Calculate the Bayes estimator for stochastic processes by using Least Square Estimate functions. The calculation is performed by the Markov chain Monte Carlo method. Currently, the Random-walk Metropolis algorithm  and the Mixed preconditioned Crank-Nicolson algorithm is implemented.In \code{lseBayes},the LSE function for estimating diffusion parameter differs from the LSE function for estimating drift parameter.\code{lseBayes} is similar to \code{adaBayes},but \code{lseBayes} calculate faster than \code{adaBayes} because of LSE functions.}
\value{
  \item{vector}{a vector of the parameter estimate}
}
\author{Yuto Yoshida with YUIMA project Team}
\note{
\code{algorithm = "nomcmc"} is unstable. \code{nomcmc} is going to be stopped. 
}
\references{
Yoshida, N. (2011). Polynomial type large deviation inequalities and quasi-likelihood analysis for stochastic differential equations. Annals of the Institute of Statistical Mathematics, 63(3), 431-479.

Uchida, M., & Yoshida, N. (2014). Adaptive Bayes type estimators of ergodic diffusion processes from discrete observations. Statistical Inference for Stochastic Processes, 17(2), 181-219.

Kamatani, K. (2017). Ergodicity of Markov chain Monte Carlo with reversible proposal. Journal of Applied Probability, 54(2). 
}
\examples{
\dontrun{
####2-dim model
set.seed(123)

b <- c("-theta1*x1+theta2*sin(x2)+50","-theta3*x2+theta4*cos(x1)+25")
a <- matrix(c("4+theta5*sin(x1)^2","1","1","2+theta6*sin(x2)^2"),2,2)

true = list(theta1 = 0.5, theta2 = 5,theta3 = 0.3, 
            theta4 = 5, theta5 = 1, theta6 = 1)
lower = list(theta1=0.1,theta2=0.1,theta3=0,
             theta4=0.1,theta5=0.1,theta6=0.1)
upper = list(theta1=1,theta2=10,theta3=0.9,
             theta4=10,theta5=10,theta6=10)
start = list(theta1=runif(1), 
             theta2=rnorm(1),
             theta3=rbeta(1,1,1), 
             theta4=rnorm(1),
             theta5=rgamma(1,1,1), 
             theta6=rexp(1))

yuimamodel <- setModel(drift=b,diffusion=a,state.variable=c("x1", "x2"),solve.variable=c("x1","x2"))
yuimasamp <- setSampling(Terminal=50,n=50*100)
yuima <- setYuima(model = yuimamodel, sampling = yuimasamp)
yuima <- simulate(yuima, xinit = c(100,80),
                  true.parameter = true,sampling = yuimasamp)

prior <-
    list(
        theta1=list(measure.type="code",df="dunif(z,0,1)"),
        theta2=list(measure.type="code",df="dnorm(z,0,1)"),
        theta3=list(measure.type="code",df="dbeta(z,1,1)"),
        theta4=list(measure.type="code",df="dgamma(z,1,1)"),
        theta5=list(measure.type="code",df="dnorm(z,0,1)"),
        theta6=list(measure.type="code",df="dnorm(z,0,1)")
    )


mle <- qmle(yuima, start = start, lower = lower, upper = upper, method = "L-BFGS-B",rcpp=TRUE) 
print(mle@coef)
set.seed(123)
bayes1 <- lseBayes(yuima, start=start, prior=prior,
                                    method="mcmc",
                                    mcmc=1000,lower = lower, upper = upper,algorithm = "randomwalk")
bayes1@coef
set.seed(123)
bayes2 <- lseBayes(yuima, start=start, prior=prior,
                                    method="mcmc",
                                    mcmc=1000,lower = lower, upper = upper,algorithm = "MpCN")
bayes2@coef

}
}
\keyword{ts}
