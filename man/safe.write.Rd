% $Id: safe.write.Rd,v 0.1 2008/07/23 02:38:31 psk Exp $
\name{safe.write}
\alias{safe.write}
\title{Write a data.frame avoiding exceeding memory limits}
\description{
   This function batches calls to \code{write.table} to avoid
   exceeding memory limits for very large data.frames.
}
\usage{
safe.write(value, file, batch, ...)
}
\arguments{
  \item{value}{a data.frame;}
  \item{file}{a file object (connection, file name, etc).}
  \item{batch}{maximum number of rows to write at a time.}
  \item{\dots}{any other arguments are passed to \code{write.table}.}
}
\details{
   The function has a while loop invoking \code{\link{write.table}}
   for subsets of \code{batch} rows of \code{value}.  Since this is
   a helper function for \code{\link{postgresqlWriteTable}}, it has
   hardcoded other arguments to \code{\link{write.table}}.
}
\value{
    \code{NULL}, invisibly.
}
\note{No error checking whatsoever is done.}

\seealso{\code{\link{write.table}}} 

\examples{\dontrun{
   ctr.file <- file("dump.sqloader", "w")
   safe.write(big.data, file = ctr.file, batch = 25000)
}
}
\keyword{internal}
%% vim: syntax=tex
