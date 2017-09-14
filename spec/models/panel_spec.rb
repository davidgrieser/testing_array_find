require 'rails_helper'

RSpec.describe Panel, type: :model do
  describe '.find_matching_antibodies' do
    context 'given an empty array' do
      it 'should return []' do
        expect(Panel.find_matching_antibodies([])).to eq([])
      end
    end

    context 'given an array with 1 antibody' do
      context 'given a panel that has only that antibody' do
        it 'should return that panel' do
          panel = Panel.create(name: 'Sample Panel')
          antibody = Antibody.create(
              name: 'Antibody',
              amount: 9.99,
              panel: panel
          )

          expect(Panel.find_matching_antibodies([antibody])).to eq([panel])
        end
      end
      context 'given a panel that has only a different antibody' do
        it 'should return []' do
          panel_one = Panel.create(name: 'Sample Panel One')
          antibody_one = Antibody.create(
              name: 'Antibody One',
              amount: 9.99,
              panel: panel_one
          )
          antibody_two = Antibody.new(
              name: 'Antibody Two',
              amount: 9.99
          )

          expect(Panel.find_matching_antibodies([antibody_two])).to eq([])
        end
      end
    end

    context 'given an array with 2 anitbodies' do
      context 'given a matching set of antibodies on a panel' do
        it 'should return that panel' do
          panel_one = Panel.create(name: 'Sample Panel One')
          antibody_one = Antibody.create(
              name: 'Antibody One',
              amount: 9.99,
              panel: panel_one
          )
          antibody_two = Antibody.new(
              name: 'Antibody Two',
              amount: 9.99,
              panel: panel_one
          )
          expect(Panel.find_matching_antibodies([antibody_one, antibody_two])).to eq([panel_one])
        end

        context 'antibodies out of order' do
          it 'should return that panel' do
            panel_one = Panel.create(name: 'Sample Panel One')
            antibody_one = Antibody.create(
                name: 'Antibody One',
                amount: 9.99,
                panel: panel_one
            )
            antibody_two = Antibody.new(
                name: 'Antibody Two',
                amount: 9.99,
                panel: panel_one
            )
            expect(Panel.find_matching_antibodies([antibody_two, antibody_one])).to eq([panel_one])
          end
        end
      end

      context 'given a panel with 2 antibodies that do not match' do
        it 'should return []' do
          panel_one = Panel.create(name: 'Sample Panel One')
          antibody_one = Antibody.create(
              name: 'Antibody One',
              amount: 9.99,
              panel: panel_one
          )
          antibody_two = Antibody.create(
              name: 'Antibody Two',
              amount: 9.99,
              panel: panel_one
          )
          antibody_three = Antibody.new(
              name: 'Antibody Three',
              amount: 9.99
          )
          antibody_four = Antibody.new(
              name: 'Antibody Four',
              amount: 9.99
          )
          expect(Panel.find_matching_antibodies([antibody_three, antibody_four])).to eq([])
        end
      end
    end

    context 'given an array with 3 anitbodies' do
      context 'given a matching set of antibodies on a panel' do
        it 'should return that panel'
      end
      context 'given a panel with 3 antibodies that do not match' do
        it 'should return []'
      end
    end
  end
end
