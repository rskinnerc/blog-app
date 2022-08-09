require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(name: 'Ronald', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Full Stack Dev.')
    @user.save
  end

  it "should have a name" do
    expect(@user.name).to eq("Ronald")
  end

  it "should have a photo" do
    expect(@user.photo).to eq("https://unsplash.com/photos/F_-0BxGuVvo")
  end

  it "should have a bio" do
    expect(@user.bio).to eq("Full Stack Dev.")
  end

  it 'should not be valid without a name' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'should not be valid without a posts counter greater or equal to 0' do
    @user.postscount = -1
    expect(@user).to_not be_valid
  end
end