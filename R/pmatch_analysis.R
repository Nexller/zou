#' 批量匹配函数
#' 先调用pmatch_analysis函数，再根据以下的代码，进入循环。
#'
#' @param query 要查询的ID列
#' @param target 要匹配的数据库
#'
#' @return
#' @export
#'
#' @examples

pmatch_analysis <- function(query,target) {
  hit <- read.delim2(file = query, sep = "\t",header = F)
  hit2 <- read.delim2(file = target, sep = "\t",header = T)
  match <-pmatch(hit[,1],hit2[,1])
  match_res <- hit2[match,]
}


# filelist = list.files(pattern="*.tsv")

# results <- list() #创建一个空的list

# for(j in filelist) {
#   list <- pmatch_analysis(j)
#   results[[i]] <- list #逐步追加到results
#   openxlsx::write.xlsx(results,"All.xlsx")
# }