module SampleData
  def create_sample_options
    FactoryGirl.create(:option, name: 'Rio de Janeiro')
    FactoryGirl.create(:option, name: 'Fortaleza')
    FactoryGirl.create(:option, name: 'São Paulo')
    FactoryGirl.create(:option, name: 'Natal')
    FactoryGirl.create(:option, name: 'Porto Alegre')
  end
end
