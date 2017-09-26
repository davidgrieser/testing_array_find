# == Schema Information
#
# Table name: panels
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Panel, type: :model do
  describe '.find_matching_antibodies' do
    def build_antibodies(letters)
      letters.collect { |letter| build(:antibody, name: "Antibody #{letter}") }
    end

    let(:single_antibody) { build_antibodies(['A']) }
    let(:two_antibodies) { build_antibodies('A'..'B') }
    let(:three_antibodies) { build_antibodies('A'..'C') }

    let!(:sample_panel_single_antibody) {
      create(:panel, antibodies: single_antibody)
    }

    let!(:sample_panel_two_antibodies) {
      create(:panel, antibodies: two_antibodies)
    }

    let!(:sample_panel_three_antibodies) {
      create(:panel, antibodies: three_antibodies)
    }

    context 'given an empty array' do
      it 'should return []' do
        expect(Panel.find_matching_antibodies([])).to eq([])
      end
    end

    context 'given an array with 1 antibody' do
      context 'with a panel that has only that antibody' do
        subject(:panel) { Panel.find_matching_antibodies(single_antibody) }

        it 'should return that panel' do
          expect(panel.count).to eq(1)
          expect(panel).to eq([sample_panel_single_antibody])
        end
      end

      context 'with a panel that has a different antibody' do
        subject(:panel) { Panel.find_matching_antibodies([build(:antibody)]) }

        it 'should return []' do
          expect(panel).to eq([])
        end
      end
    end

    context 'with a panel having antibodies A and B' do
      context 'given an array with antibodies A and B' do
        subject(:panel) { Panel.find_matching_antibodies(two_antibodies) }

        it 'should return that panel' do
          expect(panel.count).to eq(1)
          expect(panel).to eq([sample_panel_two_antibodies])
        end
      end

      context 'given an array with antibodies B and A' do
        subject(:panel) { Panel.find_matching_antibodies(build_antibodies(%w(B A))) }

        it 'should return that panel' do
          expect(panel.count).to eq(1)
          expect(panel).to eq([sample_panel_two_antibodies])
        end
      end

      context 'given an array with antibody D' do
        subject(:panel) { Panel.find_matching_antibodies(build_antibodies(['D'])) }

        it 'should return []' do
          expect(panel).to eq([])
        end
      end

      context 'given a panel with 2 antibodies that do not match' do
        subject(:panel) { Panel.find_matching_antibodies(build_antibodies(%w(D E))) }

        it 'should return []' do
          expect(panel).to eq([])
        end
      end
    end

    context 'with a panel having anitbodies A, B, and C' do
      context 'given an array with antibodies A, B, and C' do
        subject(:panel) { Panel.find_matching_antibodies(build_antibodies(%w(A B C))) }

        it 'should return that panel' do
          expect(panel.count).to eq(1)
          expect(panel).to eq([sample_panel_three_antibodies])
        end
      end

      context 'given an array with antibodies A, A, and C' do
        subject(:panel) { Panel.find_matching_antibodies(build_antibodies(%w(A A C))) }

        it 'should return []' do
          expect(panel).to eq([])
        end
      end

      context 'given a panel with 3 antibodies that do not match' do
        subject(:panel) { Panel.find_matching_antibodies(build_antibodies(%w(D E F))) }

        it 'should return []' do
          expect(panel).to eq([])
        end
      end
    end
  end
end
