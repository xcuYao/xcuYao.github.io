---
layout: post
title:  "mysql常用笔记01"
date:   2018-01-06 10:46:25 +0800
categories: mysql
---

#### 脚本批量执行sql（更改某字段自增）
{% highlight shell linenos %}
# 将db_test库中a_1至a_45表的ID字段改为自增
for i in {1..45}
do
echo "ALTER TABLE db_test.a_$i CHANGE ID ID BIGINT(20) AUTO_INCREMENT;" | mysql -h***** -u**** -p****** --default-character-set=UTF8
echo "alert a_$i success"
done
{% endhighlight %}

#### Explain 命令

|类型|解释|说明|备注|
|:---|:---|:---|:---|
|id|sql执行的顺序|EXPLAIN SELECT * FROM (SELECT * FROM gov_unit LIMIT 10) a;|先执行里边的 再执行外边的|
|select_type|查询类型|PRIMARY(使用了主键) DERIVED(派生表) SIMPLE(简单的 没有使用关联)||
|table|操作的表|||
|type|直接反映了查询的效率|速度由快到慢 const、eq_reg、ref、range、index和ALL ||
|possible_keys|可能使用到的索引|查看where字句 是否通过有索引的键来过滤||
|key|实际查询中使用的索引|||
|key_len|使用索引的长度|越短越好||
|ref||||
|rows|执行时操作的行数|||
|Extra|详细信息|看到Using filesort 、Using temporary 就需要优化sql了||


#### 查找重复记录
{% highlight sql linenos %}
-- a表中title字段重复次数超过1次的
SELECT COUNT(\*) as repetitions , ca.title, ca.id FROM a ca GROUP BY ca.title HAVING repetitions > 1;

{% endhighlight %}

#### 删除重复记录
{% highlight sql linenos %}
-- 删除 a 表中重复的title
ALTER TABLE a ENGINE MyISAM;
ALTER IGNORE TABLE a ADD UNIQUE INDEX (title);
ALTER TABLE a ENGINE InnoDB;

-- 删除 b 表中b_id,b_title,b_date
ALTER TABLE b ENGINE MyISAM;
ALTER IGNORE TABLE b ADD UNIQUE INDEX (b_id,b_title,b_date);
ALTER TABLE b ENGINE InnoDB;

{% endhighlight %}

#### 锁表、解锁
{% highlight sql linenos %}
show OPEN TABLES where In_use > 0;
show processlist;
kill [pid]
{% endhighlight %}
