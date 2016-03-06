require 'rails_helper'

RSpec.feature 'Qualification list', type: :feature do
  let(:body) do
    [{ name: 'GCSE', subjects: [
      { title: 'English', colour: nil },
      { title: 'Mathematics', colour: '#FFAAAA' }
    ] },
     { name: 'A Level', subjects: [] }]
  end

  let(:etag) { 'etag_string' }

  before(:each) do
    stub_request(:get, 'https://api.gojimo.net/api/v4/qualifications')
      .to_return(status: 200, body: body, headers: { 'Etag' => etag })

    visit '/'
  end

  scenario 'has a nice title', js: true do
    expect(page).to have_css('h1', text: 'Qualifications')
  end

  scenario 'shows some qualifications', js: true do
    expect(page).to have_selector('.qualification', count: 2)
  end

  scenario 'shows subjects on click', js: true do
    expect(page).not_to have_text('Mathematics')
    first('.qualification').click
    expect(page).to have_text('Mathematics')
    expect(first('.qualification').all('h3').last['style'])
      .to eq 'background-color:#FFAAAA'
  end

  scenario 'shows message if no subjects', js: true do
    all('.qualification').last.click
    expect(page).to have_text('This qualification has no subjects')
  end
end
