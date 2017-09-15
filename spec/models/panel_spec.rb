require 'rails_helper'

RSpec.describe Panel, type: :model do
  describe '.find_matching_antibodies' do
    def create_antibody(letter)
      Antibody.new(
        name: "Antibody #{letter}",
        amount: 9.99
      )
    end
    
    def create_antibodies(letters)
      antibodies = []
      letters.each do |letter|
        antibodies << create_antibody(letter)
      end
      antibodies
    end

    let!(:sample_panel_single_antibody) {
      Panel.create(
        name: 'Sample Panel Single Antibody',
        antibodies: [create_antibody('A')]
      )
    }
    let!(:sample_panel_two_antibodies) {
      Panel.create(
        name: 'Sample Panel Two Antibodies',
        antibodies: create_antibodies(%w(A B))
      )
    }
    let!(:sample_panel_three_antibodies) {
      Panel.create(
        name: 'Sample Panel Three Antibodies',
        antibodies: create_antibodies(%w(A B C))
      )
    }

    context 'given an empty array' do
      it 'should return []' do
        expect(Panel.find_matching_antibodies([])).to eq([])
      end
    end

    context 'given an array with 1 antibody' do
      context 'with a panel that has only that antibody' do
        subject(:panel) { Panel.find_matching_antibodies([create_antibody('A')]) }

        it 'should return that panel' do
          expect(panel.count).to eq(1)
          expect(panel).to eq([sample_panel_single_antibody])
        end
      end

      context 'with a panel that has a different antibody' do
        subject(:panel) { Panel.find_matching_antibodies([create_antibody('D')]) }

        it 'should return []' do
          expect(panel).to eq([])
        end
      end
    end

    context 'with a panel having antibodies A and B' do
      context 'given an array with antibodies A and B' do
        subject(:panel) { Panel.find_matching_antibodies(create_antibodies(%w(A B))) }

        it 'should return that panel' do
          expect(panel.count).to eq(1)
          expect(panel).to eq([sample_panel_two_antibodies])
        end
      end

      context 'given an array with antibodies B and A' do
        subject(:panel) { Panel.find_matching_antibodies(create_antibodies(%w(B A))) }

        it 'should return that panel' do
          expect(panel.count).to eq(1)
          expect(panel).to eq([sample_panel_two_antibodies])
        end
      end

      context 'given an array with antibody D' do
        subject(:panel) { Panel.find_matching_antibodies([create_antibody('D')]) }

        it 'should return []' do
          expect(panel).to eq([])
        end
      end

      context 'given a panel with 2 antibodies that do not match' do
        subject(:panel) { Panel.find_matching_antibodies(create_antibodies(%w(D E))) }

        it 'should return []' do
          expect(panel).to eq([])
        end
      end
    end

    context 'with a panel having anitbodies A, B, and C' do
      context 'given an array with antibodies A, B, and C' do
        subject(:panel) { Panel.find_matching_antibodies(create_antibodies(%w(A B C))) }

        it 'should return that panel' do
          expect(panel.count).to eq(1)
          expect(panel).to eq([sample_panel_three_antibodies])
        end
      end

      context 'given a panel with 3 antibodies that do not match' do
        subject(:panel) { Panel.find_matching_antibodies(create_antibodies(%w(D E F))) }

        it 'should return []' do
          expect(panel).to eq([])
        end
      end
    end
  end
end
