require "spec_helper"

RSpec.describe PrismicRails::QueryService do
  describe '#type', :vcr do
    context 'without language set' do
      it 'should return a prismic response' do
        expect(subject.type('text')).to be_a(Prismic::Response)
      end
    end

    context 'with language set' do
      before do
        allow_any_instance_of(PrismicRails::LanguageService).to receive(:language_hash).and_return({ en: 'en-us' })
      end
      it 'should return a prismic response' do
        expect(subject.type('text', { lang: 'en' })).to be_a(Prismic::Response)
      end
    end
  end
end
