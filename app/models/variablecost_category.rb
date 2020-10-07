class VariablecostCategory < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '食費' },
    { id: 3, name: '交通費・ガソリン代' },
    { id: 4, name: '娯楽費・交際費'},
    { id: 5, name: '医療費' },
    { id: 6, name: '日用品代'},
    { id: 7, name: '衣服費' },
    { id: 8, name: '嗜好品代' },
    { id: 9, name: '理美容費' },
    { id: 10, name: '水道光熱費(使用料金部分)' },
    { id: 11, name: '特別費' },
    { id: 12, name: 'その他' }
  ]
end