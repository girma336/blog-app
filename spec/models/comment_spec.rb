require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'should be inheritanc of' do
    expect(Comment < ApplicationRecord).to eq(true)
  end

  it 'increments the post comment counter' do
    user2 = User.create(name: 'girma', posts_counter: 1)
    author2 = Post.create(author: user2, title: 'Hello', likes_counter: 9, comments_counter: 20)
    author2.increment!(:comments_counter)
    expect(author2.comments_counter).to eq(21)
  end

  it 'increments the post comment counter' do
    user2 = User.create(name: 'girma', posts_counter: 1)
    author2 = Post.create(author: user2, title: 'Hello', likes_counter: 9, comments_counter: 20)
    comment = Comment.create(post: author2, author: user2, text: 'Hi Tom!')
    expect(comment.text).to eq('Hi Tom!')
  end
end
