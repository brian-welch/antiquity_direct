def seed_cultural_origins
  cultural_origins = %w['ancient greek' 'roman' 'chinese dynastic' 'western' 'far-eastern' 'viking' 'mesopotamian' 'babylonian' 'ancient eqymptian' 'australatian' 'polynesian' 'inowit']
  cultural_origins.each do |cultural_origin|
    new_cultural_origin = CulturalOrigin.new(name: cultural_origin)
    new_cultural_origin.save!
  end
end
