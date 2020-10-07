class FixedcostCategory < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '住居費' },
    { id: 3, name: '通信費' },
    { id: 4, name: '保険' },
    { id: 5, name: '水道光熱費(基本料金)'},
    { id: 6, name: '車ローン' },
    { id: 7, name: '契約駐車場代' },
    { id: 8, name: '教育費' },
    { id: 9, name: 'サブスクサービス' },
    { id: 10, name: '定期購入品' },
    { id: 11, name: 'その他' }
  ]
end