% $Id: make.db.names-methods.Rd,v 0.1 2008/07/22 03:16:22 psk Exp $

\name{make.db.names-methods}
\docType{methods}
\alias{SQLKeywords-methods}
\alias{isSQLKeyword-methods}
\alias{make.db.names,PostgreSQLObject,character-method}
\alias{SQLKeywords,PostgreSQLObject-method}
\alias{SQLKeywords,missing-method}
\alias{isSQLKeyword,PostgreSQLObject,character-method}
\title{
  Make R/S-Plus identifiers into legal SQL identifiers
}
\description{
   These methods are straight-forward implementations of the corresponding
   generic functions.
}
\section{Methods}{\describe{
\item{dbObj}{
  any PostgreSQL object (e.g., \code{PostgreSQLDriver}).
  }
\item{snames}{
  a character vector of R/S-Plus identifiers (symbols) from which
  we need to make SQL identifiers.
  }
\item{name}{
  a character vector of SQL identifiers we want to check against
  keywords from the DBMS.
}
\item{unique}{
  logical describing whether the resulting set of SQL names should
  be unique.  Its default is \code{TRUE}.  Following the SQL 92
  standard, uniqueness of SQL identifiers is determined regardless
  of whether letters are upper or lower case.
  }
\item{allow.keywords }{
  logical describing whether SQL keywords should be allowed in the
  resulting set of SQL names.  Its default is \code{TRUE}
  }
\item{keywords}{
  a character vector with SQL keywords, by default it is
  \code{.PostgreSQLKeywords} define in \code{RPostgreSQL}. This may
  be overriden by users.
  }
\item{case}{
  a character string specifying whether to make the comparison
  as lower case, upper case, or any of the two.
  it defaults to \code{any}.
  }
\item{\dots}{currently not used.}
}
}
\references{
  The set of SQL keywords is stored in the character vector
  \code{.SQL92Keywords} and reflects the SQL ANSI/ISO standard as
  documented in "X/Open SQL and RDA", 1994, ISBN 1-872630-68-8.
  Users can easily override or update this vector.

  PostgreSQL does add some keywords to the SQL 92 standard, they are
  listed in the \code{.PostgreSQLKeywords} object.

  See the Database Interface definition document
  \code{DBI.pdf} in the base directory of this package
  or \url{http://stat.bell-labs.com/RS-DBI}.
}
\seealso{
  \code{\link{PostgreSQL}},
  \code{\link[DBI]{dbReadTable}},
  \code{\link[DBI]{dbWriteTable}},
  \code{\link[DBI]{dbExistsTable}},
  \code{\link[DBI]{dbRemoveTable}},
  \code{\link[DBI]{dbListTables}}.
}
\examples{\dontrun{
# This example shows how we could export a bunch of data.frames
# into tables on a remote database.

con <- dbConnect("PostgreSQL", "user", "password")

export <- c("trantime.email", "trantime.print", "round.trip.time.email")
tabs <- make.db.names(export, unique = T, allow.keywords = T)

for(i in seq(along = export) )
   dbWriteTable(con, name = tabs[i],  get(export[i]))
}
}
\keyword{methods}
\keyword{interface}
\keyword{database}
% vim: syntax=tex
