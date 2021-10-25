module FactoryBotExtensions
  include ActionDispatch::TestProcess

  def file_fixture(filename)
    fixture_file_upload(Rails.root.join("spec", "fixtures", "files", filename))
  end
end
