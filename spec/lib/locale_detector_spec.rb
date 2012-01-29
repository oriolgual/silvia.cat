require 'fast_spec_helper'
require_lib 'locale_detector'

describe LocaleDetector do
  let(:params) { {'locale' => 'ca' }}
  let(:session) { {locale: :ca }}
  let(:request) { {'HTTP_ACCEPT_LANGUAGE' => 'en-US,en,ca;q=0.8'} }

  subject { LocaleDetector.new(params, session, request) }

  before do
    I18n.available_locales = [:ca, :es]
    I18n.default_locale = :de
    I18n.locale = :ch
  end

  describe 'detect_from_params' do
    it 'returns the locale from the params' do
      subject.detect_from_params.must_equal :ca
    end

    it 'returns nil if the locale is not available' do
      I18n.available_locales = [:en, :de]

      subject.detect_from_params.must_equal nil
    end
  end

  describe 'detect_from_session' do
    it 'returns the locale from the session' do
      subject.detect_from_session.must_equal :ca
    end

    it 'returns nil if the locale is not available' do
      I18n.available_locales = [:en, :de]

      subject.detect_from_params.must_equal nil
    end
  end

  describe 'detect_from_request' do
    it 'returns the first available locale' do
      subject.detect_from_request.must_equal :ca
    end

    it 'returns nil when no header' do
      subject = LocaleDetector.new({}, {}, {})

      subject.detect_from_request.must_equal nil
    end

    it 'returns nil if the locale is not available' do
      I18n.available_locales = [:es, :ch]

      subject.detect_from_request.must_equal nil
    end
  end

  describe 'detect' do
    it "gets the default locale if can't find anything" do
      subject = LocaleDetector.new({}, {}, {})

      subject.detect.must_equal :de
    end

    it 'gets the locale from the params' do
      subject = LocaleDetector.new(params, {}, {})

      subject.detect.must_equal :ca
    end

    it 'gets the locale from the session if params is nil' do
      subject = LocaleDetector.new({}, session, {})

      subject.detect.must_equal :ca
    end

    it 'gets the locale from the request if params and session is nil' do
      detector = LocaleDetector.new({}, {}, request)

      subject.detect.must_equal :ca
    end
  end
end
