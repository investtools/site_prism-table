require "spec_helper"
require 'site_prism'

describe SitePrism::Table::Element do
  let(:table) do
    '
      <thead>
        <tr>
          <th>Name</th>
          <th>Age</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>John</td>
          <td>30</td>
        </tr>
        <tr>
          <td>Mary</td>
          <td>40</td>
        </tr>
      </tbody>
    '
  end
  let(:definition) do
    SitePrism::Table::Definition.new do
      column :name
      column :age
    end
  end
  let(:element) { SitePrism::Table::Element.new(table, definition) }
  describe '#rows' do
    it 'lists the rows inside <tbody>' do
      expect(element.rows.count).to eq 2
    end
    it 'maps the columns according to definition' do
      expect(element.rows).to include name: 'John', age: '30'
    end
    context 'when definition has a format option' do
      let(:definition) do
        SitePrism::Table::Definition.new do
          column :name
          column :age, format: -> (s) { s.to_i }
        end
      end
      it 'applies that' do
        expect(element.rows).to include name: 'John', age: 30
      end
    end
    context "when there is no <thead> nor <tbody>" do
      let(:table) do
        '
          <tr>
            <th>Name</th>
            <th>Age</th>
          </tr>
          <tr>
            <td>John</td>
            <td>30</td>
          </tr>
          <tr>
            <td>Mary</td>
            <td>40</td>
          </tr>
        '
      end
      it 'ignores rows without <td>' do
        expect(element.rows.count).to eq 2
      end
    end
  end
end
