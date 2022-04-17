require 'rails_helper'

describe Posts::Create, type: :interactor do
  describe '#call' do
    context 'with correct params' do
      let(:params) { build(:post_params) }
      subject(:context) { described_class.call(params: params) }

      it 'returns with success' do
        expect(context).to be_a_success
        expect(context.post.history.present?).to be_truthy
      end

      it 'calls PostNotificationWorker' do
        expect(PostNotificationWorker).to receive(:perform_async)
        context
      end
    end

    context 'with invalid params' do
      let(:params) { build(:post_invalid_params) }
      subject(:context) { described_class.call(params: params) }

      it 'returns with failure' do
        expect(context).to be_a_failure
        expect(context.post.present?).to be_falsey
        expect(context.error.present?).to be_truthy
      end

      it 'do not calls PostNotificationWorker' do
        expect(PostNotificationWorker).to_not receive(:perform_async)
        context
      end
    end
  end
end
