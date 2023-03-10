require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

  before { subject.save }
  it 'User inharitans from ApplicationRecord' do
    expect(User < ApplicationRecord).to eq(true)
  end

  it 'return corrent name' do
    expect(subject.name).to eq('Tom')
  end

  it 'Return correct bio validate' do
    expect(subject.bio).to eq('Teacher from Mexico.')
  end

  it 'Name Should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  context 'validations' do
    it 'is valid with a name and a non-negative posts counter' do
      user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                      posts_counter: 0)
      user2 = User.new(name: 'girma', posts_counter: 1)

      expect(user).to be_valid
      expect(user2).to be_valid
    end

    it 'is invalid without a name' do
      user = User.new(posts_counter: 0)
      expect(user).to_not be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'is invalid with a negative posts counter' do
      user = User.new(name: 'Tom', posts_counter: -1)
      expect(user).to_not be_valid
      expect(user.errors[:posts_counter]).to include('must be greater than or equal to 0')
    end

    it 'is invalid with a string posts counter' do
      user = User.new(name: 'Tom', posts_counter: 'string')
      expect(user).to_not be_valid
      expect(user.errors[:posts_counter]).to include('is not a number')
    end
  end
end
