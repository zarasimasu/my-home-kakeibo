class FixedcostCategory < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '住居費' },
    { id: 3, name: 'インターネット料金' },
    { id: 4, name: 'スマホ代'},
    { id: 5, name: '保険' },
    { id: 6, name: '水道光熱費(基本料金)'},
    { id: 7, name: '車ローン' },
    { id: 8, name: '契約駐車場代' },
    { id: 9, name: '教育費' },
    { id: 10, name: 'サブスクサービス' },
    { id: 11, name: '定期購入品' },
    { id: 12, name: 'その他' }
  ]
end