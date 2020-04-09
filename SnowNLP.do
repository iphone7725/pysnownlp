version 16.0

local sen_text="`=`1'[`2']'"
python
from snownlp import SnowNLP
from sfi import Scalar
from sfi import Macro

sen_text = Macro.getLocal('sen_text')
sen = SnowNLP(sen_text)
score = sen.sentiments
Scalar.setValue('e(score)',score)
end
cap gen `1'_sentiments = .
replace `1'_sentiments = e(score) in `2'
label variable `1'_sentiments "情感分析,积极情绪的概率"