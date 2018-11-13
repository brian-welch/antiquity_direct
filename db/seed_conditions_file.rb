def seed_conditions
  conditions = %w[perfect "like new" good rustic "shows wear" ramshackle]
  conditions.each do |condition|
    new_condition = Condition.new(name: condition)
    new_condition.save!
  end
end
