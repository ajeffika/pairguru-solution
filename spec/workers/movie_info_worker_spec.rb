require 'rails_helper'
require 'sidekiq/testing'
Sidekiq::Testing.fake!
RSpec.describe MovieInfoWorker, type: :worker do
  let(:user) { create(:user) }
  let(:movie) { create(:movie) }
    it { should be_retryable false }
    let(:time) { (Time.zone.today + 6.hours).to_datetime }
    let(:scheduled_job) { described_class.perform_at(time, 'Awesome', true) }
    describe 'testing worker' do
      it 'goes into the jobs array for testing environment' do
        expect do
          described_class.perform_async(user,movie)
        end.to change(described_class.jobs, :size).by(1)
        described_class.new.perform(user,movie)
      end
      context 'occurs daily' do
        it 'occurs at expected time' do
          scheduled_job
          assert_equal true, described_class.jobs.last['jid'].include?(scheduled_job)
          expect(described_class).to have_enqueued_sidekiq_job('Awesome', true)
        end
      end
    end
end
