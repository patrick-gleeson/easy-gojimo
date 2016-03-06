class QualificationFetcher
  include HTTParty

  base_uri 'https://api.gojimo.net'

  attr_reader :data, :status, :etag

  def initialize(etag: nil)
    options = prepare_options etag
    response = make_request options
    write_instance_variables response
  rescue HTTParty::Error => e
    Rails.logger.warn "Error getting qualifications: #{e.message}"
    set_error_state
  end

  private

  def prepare_options(etag = nil)
    {}.tap do |opts|
      opts[:headers] = {
        'If-None-Match' => disable_weak_validation(etag)
      } if etag
    end
  end

  def make_request(options)
    self.class.get('/api/v4/qualifications', options)
  end

  def disable_weak_validation(etag)
    etag.gsub(%r{\AW\/}, '')
  end

  def write_instance_variables(response)
    @data = response.body if response.code == 200
    @status = response.code
    @etag = response.headers['Etag']
  end

  def set_error_state
    @data = nil
    @status = 500
  end
end
