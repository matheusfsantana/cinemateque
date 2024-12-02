require 'rails_helper'

RSpec.describe Actor, type: :model do
  it { should validate_presence_of(:name)  }
  it { should validate_presence_of(:nacionality)  }
  it { should validate_presence_of(:birth_date)  }
  it { should have_many(:roles) }
end
