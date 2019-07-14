class SalesController < ApplicationController

  def index
    @sales=Sale.all
  end

  def new
    @sale=Sale.new
  end

  def create
    @sale=Sale.new(sale_params)
    valor_con_descuento=@sale.value-@sale.discount

      if @sale.tax==0
        iva=1.19
        total= valor_con_descuento*iva
        @sale.total=total
        @sale.tax=19

      else

          total=valor_con_descuento
          @sale.total=total
          @sale.tax=0

      end

      @sale.save
      redirect_to sale_path(@sale, :id)
  end

  def done
    @sale=Sale.find(params[:id])
  end


  private
  def sale_params
    params.require(:sale).permit(:cod, :detail, :category, :value, :tax, :total, :discount, :id)
  end

end
