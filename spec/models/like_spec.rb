require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'should be inheritanc of' do
    expect(Like < ApplicationRecord).to eq(true)
  end

  it 'increments the post likes counter' do
    user2 = User.create(name: 'girma', posts_counter: 1)
    author = Post.create(author: user2, title: 'Hello', likes_counter: 9)
    author.increment!(:likes_counter)
    expect(author.likes_counter).to eq(10)
  end
end
