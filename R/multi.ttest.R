#' 多重t-test计算
#' 这个函数用于计算多个变量，两两之间的t-test
#' @param mat dataframe
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
#' multi.ttest(mtcars)


multi.ttest <- function(mat, ...) {
  mat <- as.matrix(mat)
  n <- ncol(mat)
  p.mat<- matrix(NA, n, n)
  diag(p.mat) <- 1
  for (i in 1:(n - 1)) {
    for (j in (i + 1):n) {
      test <- t.test(paired = T,mat[, i], mat[, j], ...)
      p.mat[i, j] <- p.mat[j, i] <- test$p.value
    }
  }
  colnames(p.mat) <- rownames(p.mat) <- colnames(mat)
  signif(p.mat,4)
}
