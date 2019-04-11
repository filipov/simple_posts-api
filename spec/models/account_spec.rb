# frozen_string_literal: true

RSpec.describe Account, type: :model do
  describe '#valid' do
    context 'with invalid login' do
      let(:data) { { login: '#$!', password: '12345678' } }

      it { expect(subject.valid?).to eql(false) }

      it 'should include login error' do
        subject.valid?

        expect(subject.errors[:login])
          .to eql(['is invalid'])
      end
    end

    context 'with invalid password' do
      subject { build(:account, password: '123abc%^') }

      it { expect(subject.valid?).to eql(false) }

      it 'should include password error' do
        subject.valid?

        expect(subject.errors[:password])
          .to eql(['must include an uppercase letter (A-Z)'])
      end
    end

    context 'with bad password confirmation' do
      subject { build(:account_with_bad_password_confirmation) }

      it { expect(subject.valid?).to eql(false) }

      it 'should include password_confirmation error' do
        subject.valid?

        expect(subject.errors[:password_confirmation])
          .to eql(['doesn\'t match Password'])
      end
    end
  end
end
