class IncomeCategory < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '給料' },
    { id: 3, name: 'ボーナス' },
    { id: 4, name: '特別収入' },
    { id: 5, name: 'その他収入'}
  ]
end