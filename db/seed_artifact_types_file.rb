def seed_artifact_types
  artifact_types = %w[armour weapon book scroll painting toy map invention clothing skulpture building]
  artifact_types.each do |artifact_type|
    new_artifact_type = ArtifactType.new(name: artifact_type)
    new_artifact_type.save!
  end
end
