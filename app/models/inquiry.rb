# frozen_string_literal: true

class Inquiry
  include ActiveModel::Model

  attr_accessor :name, :email, :message # DBを扱わない純粋なRubyのコード

  validates :name, presence: { message: '名前を入力してください' }
  validates :email, presence: { message: 'メールアドレスを入力してください' }
end
