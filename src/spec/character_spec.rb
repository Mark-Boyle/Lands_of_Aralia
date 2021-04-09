require_relative '../character.rb'
# require_relative '../index.rb'

RSpec.describe Character do
    subject(:character){
        Character.new
    }
        context 'check updating elf stats' do
            before(:each) do 
                character.update_elf_stats
            end

            it 'should update sword_skill to 2' do
                expect(character.sword_skill).to eq(2)
            end

            it 'should not update sword_skill to 3' do
                expect(character.sword_skill).not_to eq(3)
            end

            it 'should update archery_skill to 5' do
                expect(character.archery_skill).to eq(5)
            end
        end

        context 'check restore_health method' do
            it 'should update character_health to 120 when on level 2' do
                character.restore_health(2)
                expect(character.character_health).to eq(120) 
            end

            it 'should not update character_health to 120 when on level 3' do
                character.restore_health(3)
                expect(character.character_health).not_to eq(120) 
            end
        end

        context 'check generated damage' do
            it 'should produce an integer when Use Sword is choosen' do
                expect(character.generate_sword_damage).to be_a Integer 
            end
        end
    end
