
*Stata调用Python的SnowNLP进行中文情感分析
*do SnowNLP v 20
*对变量v的第20行运行情感分析
*简略版,仅支持逐行分析
*使用循环可以进行批量处理
infix strL v 1-20000 using test.txt,clear
keep if v!=""

local n = _N
forvalues i = 1(1)`n' {
	qui do SnowNLP v `i'
}

*简要分析*
gen len = length(v)/3
sum len
hist len,width(10)
sum v_sentiments if len>10
reg v_sentiments len if len>10