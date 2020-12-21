#' 标准误汇总
#' 该程序用于计算数据框的平均值和标准误SE
#' @param data 数据框
#' @param varname 目标数据列
#' @param groupnames 分组
#' @param digtal 结果的小数点
#'
#' @return
#' @export
#'
#' @examples
#' SE_summary(iris,varname = "Petal.Width", groupnames = "Species", digtal = 2)


SE_summary <- function(data, varname, groupnames, digtal){
  require(dplyr)
  require(plyr)
  summary_func <- function(x, col){
    c(mean = round(mean(x[[col]], na.rm=TRUE), digits = digtal),
      se = round(sd(x[[col]]/sqrt(length(x[[col]])), na.rm=TRUE), digits = digtal))
  }
  data_sum<-ddply(data, groupnames, .fun=summary_func,
                  varname)
  data_sum <- rename(data_sum, c("mean" = varname))
  return(data_sum)
}

