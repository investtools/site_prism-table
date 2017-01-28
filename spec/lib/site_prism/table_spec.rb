require "spec_helper"
require 'site_prism'

describe SitePrism::Table do
  let(:page_class) do
    Class.new(SitePrism::Page) do
      extend SitePrism::Table

      set_url "file://#{File.expand_path("../../../fixtures/test.html", __FILE__)}"

      table :people, 'table#people' do
        column :name
        column :age
      end
    end
  end

  it "has a version number" do
    expect(SitePrism::Table::VERSION).not_to be nil
  end

  describe '.table' do
    it 'generates the table accessor method' do
      expect(page_class.new).to respond_to :people
    end
  end

  describe 'generated table method' do
    it 'returns a table element' do
      page = page_class.new
      page.load
      expect(page.people).to be_a SitePrism::Table::Element
    end
  end
end
