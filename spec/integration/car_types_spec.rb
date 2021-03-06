require 'swagger_helper'

RSpec.describe 'api/car_types', type: :request do
  path '/api/v1/cars_types_controller' do
    post 'Creates a CarType' do
      tags 'CarsTypes'
      consumes 'application/json'
      parameter name: :car_type, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer },
          make: { type: :string },
          model: { type: :string },
          car_id: { type: :integer },
          created_at: { type: :string },
          updated_at: { type: :string }
        },
        required: %w[id make car_id model]
      }

      response '201', 'car created' do
        let(:car) { { title: 'foo', content: 'bar' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:blog) { { title: 'foo' } }
        run_test!
      end
    end
  end

  path '/blogs/{id}' do
    get 'Retrieves a car_type' do
      tags 'Cars', 'Another Tag'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'car found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 make: { type: :string },
                 model: { type: :string },
                 car_id: { type: :integer },
                 created_at: { type: :string },
                 updated_at: { type: :string }
               },
               required: %w[id make car_id model]

        let(:id) { Car_Type.create(id: '1', name: 'bar', image_data: 'wnjedjdj').id }
        run_test!
      end

      response '404', 'car not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:Accept) { 'application/foo' }
        run_test!
      end
    end
  end
end
