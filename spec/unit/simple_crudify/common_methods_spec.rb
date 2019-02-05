require 'spec_helper'

RSpec.describe SimpleCrudify::CrudActions do
  let(:resource)  { 1 }
  let(:resources) { [] }

  let(:controller_klass) do
    Class.new do
      class << self
        def resource_params; end

        def render(template_path); end

        def template_path(options={}); end

        def redirect_to(path); end

        def model_klass
          Model.new
        end

        def params
          { id: 1 }
        end
      end
    end
  end

  before do
    class Model
      def new(_params={})
        self
      end

      def all
        []
      end

      def find(id)
        id
      end
    end
  end

  describe SimpleCrudify::CrudActions::Index do
    before { controller_klass.extend(described_class) }

    describe '#index' do
      subject { controller_klass.index }

      it 'render index page' do
        expect(controller_klass).to receive(:render)
        expect(controller_klass).to receive(:template_path)

        subject

        expect(controller_klass.instance_variable_get(:@resources)).to eq resources
      end
    end
  end

  describe SimpleCrudify::CrudActions::Show do
    before { controller_klass.extend(described_class) }

    describe '#show' do
      subject { controller_klass.show }

      it 'render show page' do
        expect(controller_klass).to receive(:render)
        expect(controller_klass).to receive(:template_path)

        subject

        expect(controller_klass.instance_variable_get(:@resource)).to eq resource
      end
    end
  end

  describe SimpleCrudify::CrudActions::New do
    before { controller_klass.extend(described_class) }

    describe '#new' do
      subject { controller_klass.new }

      it 'render new page' do
        expect(controller_klass).to receive(:render)
        expect(controller_klass).to receive(:template_path)

        subject
      end
    end
  end

  describe SimpleCrudify::CrudActions::Create do
    before { controller_klass.extend(described_class) }

    describe '#create' do
      subject { controller_klass.create }

      context 'when record is saved without errors' do
        let(:path) { '/' }

        before { allow_any_instance_of(Model).to receive(:save).and_return(true) }
        before { allow(controller_klass).to receive(:after_create_path).and_return(path) }

        it 'redirects to after_create_path' do
          expect(controller_klass).to receive(:redirect_to).with(path)

          subject
        end
      end

      context 'when record is not saved' do
        before { allow_any_instance_of(Model).to receive(:save).and_return(false) }

        it 'render new page' do
          expect(controller_klass).to receive(:render)
          expect(controller_klass).to receive(:template_path).with(:new)

          subject
        end
      end
    end
  end

  describe SimpleCrudify::CrudActions::Edit do
    before { controller_klass.extend(described_class) }

    describe '#edit' do
      subject { controller_klass.edit }

      it 'render show page' do
        expect(controller_klass).to receive(:render)
        expect(controller_klass).to receive(:template_path)

        subject

        expect(controller_klass.instance_variable_get(:@resource)).to eq resource
      end
    end
  end

  describe SimpleCrudify::CrudActions::Update do
    before { controller_klass.extend(described_class) }

    describe '#update' do
      before { allow_any_instance_of(Model).to receive(:find).and_return(Model.new) }

      subject { controller_klass.update }

      context 'when record is saved without errors' do
        let(:path) { '/' }

        before { allow_any_instance_of(Model).to receive(:update).and_return(true) }
        before { allow(controller_klass).to receive(:after_update_path).and_return(path) }

        it 'redirects to after_update_path' do
          expect(controller_klass).to receive(:redirect_to).with(path)

          subject
        end
      end

      context 'when record is not saved' do
        before { allow_any_instance_of(Model).to receive(:update).and_return(false) }

        it 'render edit page' do
          expect(controller_klass).to receive(:render)
          expect(controller_klass).to receive(:template_path).with(:edit)

          subject
        end
      end
    end
  end

  describe SimpleCrudify::CrudActions::Destroy do
    before { controller_klass.extend(described_class) }

    describe '#destroy' do
      let(:path) { '/' }

      before { allow(controller_klass).to receive(:after_destroy_path).and_return(path) }

      before { allow_any_instance_of(Model).to receive(:find).and_return(Model.new) }
      before { allow_any_instance_of(Model).to receive(:destroy).and_return(false) }

      subject { controller_klass.destroy }

      it 'destroy resource' do
        expect(controller_klass).to receive(:redirect_to).with(path)

        subject
      end
    end
  end
end
