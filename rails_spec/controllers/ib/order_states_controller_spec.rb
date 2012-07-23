require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe OrderStatesController do

  # This should return the minimal set of attributes required to create a valid
  # OrderState. As you add validations to OrderState, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # OrderStatesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all order_states as @order_states" do
      order_state = OrderState.create! valid_attributes
      get :index, {}, valid_session
      assigns(:order_states).should eq([order_state])
    end
  end

  describe "GET show" do
    it "assigns the requested order_state as @order_state" do
      order_state = OrderState.create! valid_attributes
      get :show, {:id => order_state.to_param}, valid_session
      assigns(:order_state).should eq(order_state)
    end
  end

  describe "GET new" do
    it "assigns a new order_state as @order_state" do
      get :new, {}, valid_session
      assigns(:order_state).should be_a_new(OrderState)
    end
  end

  describe "GET edit" do
    it "assigns the requested order_state as @order_state" do
      order_state = OrderState.create! valid_attributes
      get :edit, {:id => order_state.to_param}, valid_session
      assigns(:order_state).should eq(order_state)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new OrderState" do
        expect {
          post :create, {:order_state => valid_attributes}, valid_session
        }.to change(OrderState, :count).by(1)
      end

      it "assigns a newly created order_state as @order_state" do
        post :create, {:order_state => valid_attributes}, valid_session
        assigns(:order_state).should be_a(OrderState)
        assigns(:order_state).should be_persisted
      end

      it "redirects to the created order_state" do
        post :create, {:order_state => valid_attributes}, valid_session
        response.should redirect_to(OrderState.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved order_state as @order_state" do
        # Trigger the behavior that occurs when invalid params are submitted
        OrderState.any_instance.stub(:save).and_return(false)
        post :create, {:order_state => {}}, valid_session
        assigns(:order_state).should be_a_new(OrderState)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        OrderState.any_instance.stub(:save).and_return(false)
        post :create, {:order_state => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested order_state" do
        order_state = OrderState.create! valid_attributes
        # Assuming there are no other order_states in the database, this
        # specifies that the OrderState created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        OrderState.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => order_state.to_param, :order_state => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested order_state as @order_state" do
        order_state = OrderState.create! valid_attributes
        put :update, {:id => order_state.to_param, :order_state => valid_attributes}, valid_session
        assigns(:order_state).should eq(order_state)
      end

      it "redirects to the order_state" do
        order_state = OrderState.create! valid_attributes
        put :update, {:id => order_state.to_param, :order_state => valid_attributes}, valid_session
        response.should redirect_to(order_state)
      end
    end

    describe "with invalid params" do
      it "assigns the order_state as @order_state" do
        order_state = OrderState.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        OrderState.any_instance.stub(:save).and_return(false)
        put :update, {:id => order_state.to_param, :order_state => {}}, valid_session
        assigns(:order_state).should eq(order_state)
      end

      it "re-renders the 'edit' template" do
        order_state = OrderState.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        OrderState.any_instance.stub(:save).and_return(false)
        put :update, {:id => order_state.to_param, :order_state => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested order_state" do
      order_state = OrderState.create! valid_attributes
      expect {
        delete :destroy, {:id => order_state.to_param}, valid_session
      }.to change(OrderState, :count).by(-1)
    end

    it "redirects to the order_states list" do
      order_state = OrderState.create! valid_attributes
      delete :destroy, {:id => order_state.to_param}, valid_session
      response.should redirect_to(order_states_url)
    end
  end

end
