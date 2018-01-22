FactoryBot.define do

  factory :foo_fixed, class: 'Foo' do
    name "test"
    # name { test }
  end
  # factory :foo, :parent=>:foo_fixed do
  # end
  factory :foo_sequence, class: 'Foo' do
    sequence(:name) { |n| "test#{n}" }
  end

  factory :foo_names, class: 'Foo' do
    sequence(:name) { |n| ["larry", "moe", "michael"][n%3] }
  end

  factory :foo_transient, class: 'Foo' do
    name "test"
    transient do
      male true
    end
    after(:build) do |object, props|
      object.name = props.male ? "Mr Test" : "Ms Test"
    end
  end

  factory :foo_ctor, class: 'Foo' do
    transient do
      hash {}
    end
    initialize_with {Foo.new(hash)}
  end

  factory :foo_faker, class: 'Foo' do
    name { Faker::Name.name }
  end

  factory :foo, :parent=>:foo_faker do
  end

  factory :bar do
    name { Faker::Team.name.titleize }
  end
end
