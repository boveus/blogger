require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "Validations" do
    before(:each) do
      Article.create(
      title: 'first post',
      body: 'this is my first post'
      )

      Article.create(
      title: 'second post',
      body: 'this is my first post'
      )

      Article.create(
      title: 'third post',
      body: 'this is my third post'
      )
    end
    it "can create a new article." do

      expect(Article.first.title).to eq('first post')
      expect(Article.second.title).to eq('second post')
      expect(Article.third.title).to eq('third post')
    end
  end
end
