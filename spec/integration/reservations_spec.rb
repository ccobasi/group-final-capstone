require 'swagger_helper'

RSpec.describe 'api/reservations', type: :request do
    path '/api/v1/cars_controller'do

        post 'Creates a reservation' do
          tags 'Reservation'
          consumes 'application/json'
          parameter name: :car, in: :body, schema: {
            type: :object,
            properties: {
                car_id: { type: :integer },
                user_id: { type: :integer },
                created_at: { type: :string },,
                reserve: { type: :bolean },
                date: { type: :datetime },
                created_at: { type: :string },
                updated_at: { type: :string },
            

    "created_at": "2021-10-22T20:33:13.209Z",
    "updated_at": "2021-10-22T20:33:13.209Z"
            },
            required: [ 'id', 'name', 'image_data' ]
          }
    
          response '201', 'car created' do
            let(:car) { { title: 'foo', content: 'bar' } }
            run_test!
          end
    
          response '422', 'invalid request' do
            let(:reservation) { { title: 'foo' } }
            run_test!
          end
        end
      end
    
      path '/reservationss/{id}' do
    
        get 'Retrieves a reservation' do
          tags 'Cars', 'Another Tag'
          produces 'application/json', 'application/xml'
          parameter name: :id, in: :path, type: :string
    
          response '200', 'car found' do
            schema type: :object,
              properties: {
                car_id: { type: :integer },
                user_id: { type: :integer },
                created_at: { type: :string },
                reserve: { type: :bolean },
                date: { type: :datetime },
                created_at: { type: :string },
                updated_at: { type: :string },
              },
              required: [ 'id', 'name', 'image_data' ]
    
            let(:id) { Reservation.create(id: '1', name: 'bar', image_data: 'wnjedjdj').id }
            run_test!
          end
    
          response '404', 'car not found' do
            let(:id) { 'invalid' }
            run_test!
          end
    
          response '406', 'unsupported accept header' do
            let(:'Accept') { 'application/foo' }
            run_test!
          end
        end
      end
end
