class QualificationsController < ApplicationController
  def index
    fetcher = QualificationFetcher.new(etag: request.headers['If-None-Match'])
    render json: fetcher.data,
           status: fetcher.status,
           headers: { 'Etag' => fetcher.etag }
  end
end
