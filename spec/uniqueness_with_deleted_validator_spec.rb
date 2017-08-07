require 'spec_helper'

describe UniquenessWithDeletedValidator do
  describe 'uniqueness_with_deleted: true' do
    let(:testClass) do
      Class.new(TestModel) do
        validates :name, uniqueness_with_deleted: true
      end
    end
    let(:record) { testClass.new(name: 'Peter') }

    context 'exists returns false' do
      before { allow(testClass).to receive_message_chain(:with_deleted, :where, :where, :not, :exists?).and_return false }

      it 'is valid' do
        expect(record).to be_valid
      end
    end

    context 'exist returns true' do
      before do
        allow(testClass).to receive_message_chain(:with_deleted, :where, :where, :not, :exists?).and_return true
        allow(I18n).to receive(:t).with('.activerecord.errors.base.taken').and_return 'has already been taken'
      end

      it 'is not valid' do
        expect(record).to be_invalid
        expect(record.errors[:name]).to include 'has already been taken'
      end

      context 'with custom message' do
        let(:testClass) do
          Class.new(TestModel) do
            validates :name, uniqueness_with_deleted: { message: 'Error !' }
          end
        end

        it 'is not valid with custom error' do
          expect(record).to be_invalid
          expect(record.errors[:name]).to include 'Error !'
        end
      end
    end
  end

  describe 'validates_uniqueness_with_deleted_of' do
    let(:testClassWithShorthand) do
      Class.new(TestModel) do
        validates_uniqueness_with_deleted_of :name
      end
    end
    let(:record) { testClassWithShorthand.new(name: 'Peter') }

    context 'exists returns false' do
      before { allow(testClassWithShorthand).to receive_message_chain(:with_deleted, :where, :where, :not, :exists?).and_return false }

      it 'is valid' do
        expect(record).to be_valid
      end
    end

    context 'exist returns true' do
      before do
        allow(testClassWithShorthand).to receive_message_chain(:with_deleted, :where, :where, :not, :exists?).and_return true
        allow(I18n).to receive(:t).with('.activerecord.errors.base.taken').and_return 'has already been taken'
      end

      it 'is not valid(works with shorthand)' do
        expect(record).to be_invalid
        expect(record.errors[:name]).to include 'has already been taken'
      end
    end
  end
end
