require 'rails_helper'

RSpec.describe Post, type: :model do
  first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  subject { Post.create(author: first_user, title: 'Hello', text: 'This is my first post') }
  it 'should be inheritanc of' do
    expect(Post < ApplicationRecord).to eq(true)
  end
  before { subject.save }
  it 'title should be equle to Hello' do
    expect(subject.title).to eq('Hello')
  end

  it 'text should be given strirng' do
    expect(subject.text).to eq('This is my first post')
  end

  it 'author shold be ' do
    expect(subject.author).to eq(first_user)
  end

  context 'Check all Validation' do
    it 'auther shoul be presence' do
      author = Post.new(title: 'Hello')
      expect(author).to_not be_valid
      expect(author.errors[:author]).to include('must exist')
    end

    it 'title should ne presence' do
      user2 = User.new(name: 'girma', posts_counter: 1)
      user2.save
      author = Post.new(author: user2, title: 'Hello')
      expect(author).to be_valid
    end

    it 'title should ne presence' do
      user2 = User.new(name: 'girma', posts_counter: 1)
      user2.save
      author = Post.new(author: user2, title: 'Hello', likes_counter: 0)
      expect(author).to be_valid
    end

    it 'title should ne presence' do
      user2 = User.new(name: 'girma', posts_counter: 1)
      user2.save
      author = Post.new(author: user2, title: 'Hello', likes_counter: -80)
      expect(author).to_not be_valid
      expect(author.errors[:likes_counter]).to include('must be greater than or equal to 0')
    end
  end

  context 'validation' do
    it 'title should ne presence' do
      user2 = User.new(name: 'girma', posts_counter: 1)
      user2.save
      author = Post.new(author: user2, likes_counter: 80)
      expect(author).to_not be_valid
      expect(author.errors[:title]).to include("can't be blank")
    end

    it 'title should ne presence' do
      user2 = User.new(name: 'girma', posts_counter: 1)
      user2.save
      author = Post.new(author: user2, title: 'Hello', likes_counter: 'girma', comments_counter: 10)
      expect(author).to_not be_valid
      expect(author.errors[:likes_counter]).to include('is not a number')
    end

    it 'title should ne presence' do
      user2 = User.new(name: 'girma', posts_counter: 1)
      user2.save
      author = Post.new(author: user2, title: 'Hello', likes_counter: 0, comments_counter: -11)
      expect(author).to_not be_valid
      expect(author.errors[:comments_counter]).to include('must be greater than or equal to 0')
    end
  end
end
