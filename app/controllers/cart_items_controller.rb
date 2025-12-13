class CartItemsController < ApplicationController
  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    @product = @cart_item.product
    @cart_item.destroy

    flash[:warning] = "成功將 #{@product.title} 從購物車刪除！"
    redirect_to :back
  end

  def update
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])

    redirect_to carts_path
  end

  private

  def cart_item_params
    params.require(:cart_items).permit(:quantity)
  end
end
